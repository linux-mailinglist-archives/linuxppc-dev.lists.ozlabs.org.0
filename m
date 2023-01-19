Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0E673D58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyRC14rHBz3fGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MP2LDF3y;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BwEy8wu9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MP2LDF3y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BwEy8wu9;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyR9m08YZz3fGP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:19:07 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 159C13FBA6;
	Thu, 19 Jan 2023 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674141540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blyh4F6YIPd83bc9ZsTz1gC1AOEbrks+HSyE4iFGx9k=;
	b=MP2LDF3yx8TEIh3fADMhFa+a/auaOINU/0J1rlhw3mzqPqwt3QK6fI7Ucmcs3y9B/UJKXB
	eMp5Z7mxxODX6k2cUmcH/sxC3RMT7trXy2YVADUDk7T1eBXqjhB2y6F48r9HWG7FuG8sHZ
	Edlma/sE8KtTqSuBov5qRz/dpMR53RM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674141540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blyh4F6YIPd83bc9ZsTz1gC1AOEbrks+HSyE4iFGx9k=;
	b=BwEy8wu90TO0wfPnVi88AKZO2d3X2n2DpfGeZufKFrGknIf0EVn8zMTjxhFHsxeLLbabqj
	Q0//Yl8rqHyrGCAA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id CD2442C141;
	Thu, 19 Jan 2023 15:18:58 +0000 (UTC)
Date: Thu, 19 Jan 2023 16:18:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <20230119151857.GQ16547@kitsune.suse.cz>
References: <20230111161155.1349375-1-gary@garyguo.net>
 <20230112214059.o4vq474c47edjup6@ldmartin-desk2>
 <20230113181841.4d378a24.gary@garyguo.net>
 <20230117175144.GI16547@kitsune.suse.cz>
 <20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
 <20230119150936.30811312.gary@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119150936.30811312.gary@garyguo.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 03:09:36PM +0000, Gary Guo wrote:
> On Tue, 17 Jan 2023 11:22:45 -0800
> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> 
> > On Tue, Jan 17, 2023 at 06:51:44PM +0100, Michal Suchánek wrote:
> > >Hello,
> > >
> > >On Fri, Jan 13, 2023 at 06:18:41PM +0000, Gary Guo wrote:  
> > >> On Thu, 12 Jan 2023 14:40:59 -0700
> > >> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > >>  
> > >> > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote:  
> > >> > >
> > >> > > struct modversion_info {
> > >> > >-	unsigned long crc;
> > >> > >-	char name[MODULE_NAME_LEN];
> > >> > >+	/* Offset of the next modversion entry in relation to this one. */
> > >> > >+	u32 next;
> > >> > >+	u32 crc;
> > >> > >+	char name[0];  
> > >> >
> > >> > although not really exported as uapi, this will break userspace as this is
> > >> > used in the  elf file generated for the modules. I think
> > >> > this change must be made in a backward compatible way and kmod updated
> > >> > to deal with the variable name length:
> > >> >
> > >> > kmod $ git grep "\[64"
> > >> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint32_t)];
> > >> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint64_t)];
> > >> >
> > >> > in kmod we have both 32 and 64 because a 64-bit kmod can read both 32
> > >> > and 64 bit module, and vice versa.
> > >> >  
> > >>
> > >> Hi Lucas,
> > >>
> > >> Thanks for the information.
> > >>
> > >> The change can't be "truly" backward compatible, in a sense that
> > >> regardless of the new format we choose, kmod would not be able to decode
> > >> symbols longer than "64 - sizeof(long)" bytes. So the list it retrieves
> > >> is going to be incomplete, isn't it?
> > >>
> > >> What kind of backward compatibility should be expected? It could be:
> > >> * short symbols can still be found by old versions of kmod, but not
> > >>   long symbols;  
> > >
> > >That sounds good. Not everyone is using rust, and with this option
> > >people who do will need to upgrade tooling, and people who don't care
> > >don't need to do anything.  
> > 
> > that could be it indeed. My main worry here is:
> > 
> > "After the support is added in kmod, kmod needs to be able to output the
> > correct information regardless if the module is from before/after the
> > change in the kernel and also without relying on kernel version."
> > Just changing the struct modversion_info doesn't make that possible.
> > 
> > Maybe adding the long symbols in another section?
> 
> Yeah, that's what I imagined how it could be implemented when I said
> "short symbols can still be found by old versions of kmod, but not long
> symbols".
> 
> > Or ble just increase to 512 and add the size to a
> > "__versions_hdr" section. If we then output a max size per module,
> > this would offset a little bit the additional size gained for the
> > modules using rust.
> 
> That format isn't really elegant IMO. And symbol length can vary a lot,
> having all symbols dictated by the longest symbol doesn't sound a good
> approach.
> 
> > And the additional 0's should compress well
> > so I'm not sure the additional size is that much relevant here.
> 
> I am not sure why compression is mentioned here. I don't think section
> in .ko files are compressed.

There is the option to compress the whole .ko files, and it's commonly
used.

Thanks

Michal
