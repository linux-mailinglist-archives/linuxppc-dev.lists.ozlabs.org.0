Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B976ED4524
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 18:13:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qY0p6kxdzDqZj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 03:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=chromium.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="U5/N6JMi";
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qXyZ47dkzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 03:11:49 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id q15so4664823pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G6L52gHbcOVXjcPSYcPZfDCdfNGSvtith//1lglITt4=;
 b=U5/N6JMiUj9QDTd24aIgmkS/ZCmGBjpKwM7U8CzxrzMf1lqZSNfbZ7O4pwV0bhEzEg
 wudUUYrZzrgNiboJm0ChoceZ3O1LmYFYV3Bvx9uhV6vTeclkuNrnADNJMjD6VX65LBtL
 he7FMaEjTbOKTJQ5f79wUMqxbvVvSYa6+a7mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G6L52gHbcOVXjcPSYcPZfDCdfNGSvtith//1lglITt4=;
 b=KBrWdsaPkDzgxeTP+Lc2ZReEpDv28nA9oaEm7KfWDa1krr5C0T9dl5d0+W4k3xqO25
 CQ6u3aUt16WxpoSEdWJP321NFiZKHy4duGjXlpzhr+v+kpPZ9pnf2/7toJ2fUMl9lOeu
 6JCRqay/3RFdFpncPGYEFcZ5jiRYRprgjv+pATmy7erSYb8eVIF+/dx7W8YKMnoA7TRn
 bnGUUBGS68WUlwSiWfss4JCQcBHKZI+bAEPU+lb7yjmtXkkTTCpcDccRajQBaEis0cNp
 sMpu1vmA5sbVRY4/6bd6zduXSPXrbJ+69nBxT1pL6hskwNJMkDNfJ+4Om41Lic/9wSHR
 CKUw==
X-Gm-Message-State: APjAAAWEMCpBe5p/h6VEpd3bsMd4eRAcr3865gWSoywnNVHxGIEKpFKc
 FMpleHjLG0ilex4xS/DNGz/02g==
X-Google-Smtp-Source: APXvYqybFKi8DEP43HWkgZPyfZo8SqqFMMtnLHZ2tVbdiQx6dZitTSLWHEWMqDIFXmSN2gN3R3/hRg==
X-Received: by 2002:a17:902:bf45:: with SMTP id
 u5mr15982728pls.62.1570810305781; 
 Fri, 11 Oct 2019 09:11:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id f6sm9294369pfq.169.2019.10.11.09.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 09:11:44 -0700 (PDT)
Date: Fri, 11 Oct 2019 09:11:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 01/29] powerpc: Rename "notes" PT_NOTE to "note"
Message-ID: <201910110910.48270FC97@keescook>
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-2-keescook@chromium.org>
 <20191011082519.GI9749@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011082519.GI9749@gate.crashing.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-ia64@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linux-alpha@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2019 at 03:25:19AM -0500, Segher Boessenkool wrote:
> On Thu, Oct 10, 2019 at 05:05:41PM -0700, Kees Cook wrote:
> > The Program Header identifiers are internal to the linker scripts. In
> > preparation for moving the NOTES segment declaration into RO_DATA,
> > standardize the identifier for the PT_NOTE entry to "note" as used by
> > all other architectures that emit PT_NOTE.
> 
> All other archs are wrong, and "notes" is a much better name.  This
> segment does not contain a single "note", but multiple "notes".

True, but the naming appears to be based off the Program Header name of
"PT_NOTE". Regardless, it is an entirely internal-to-the-linker-script
identifier, so I am just consolidating on a common name with the least
number of collateral changes.

-- 
Kees Cook
