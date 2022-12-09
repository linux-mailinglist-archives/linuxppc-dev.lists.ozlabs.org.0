Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7676648293
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 13:50:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NT9q45K0Tz3bfd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 23:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=pcHFkCbP;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EZnfLtfq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=pcHFkCbP;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EZnfLtfq;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT9p54LMXz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 23:49:33 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A900B337EB;
	Fri,  9 Dec 2022 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1670590169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0PF6L6bT8F2yAUxeD3fQ98XkB3nRgsmzc0APw/zhms=;
	b=pcHFkCbPUXvxZ+gPlNARE22n9L4dTy2Zl20aC6Dz8fB+sDLJ1gYaJwEfOogRXO/Wf/xODg
	4LHIYnfs31cO6P3cbkvY4mobvowIkZSafKtds7zX/JhKP96BPVf0Ts0nMyiCHshEfx/PIA
	lT/1ZbcMRFxLi8XckCREnrVLpSjeH98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1670590169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0PF6L6bT8F2yAUxeD3fQ98XkB3nRgsmzc0APw/zhms=;
	b=EZnfLtfqdPSpvIndz/ogrK1bONs7jsx/e0jt4kjHLij69J9q66DioRtIm9RDayNAFjZYQj
	Ulo0yBi/zvfbEuDQ==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 6FE712C142;
	Fri,  9 Dec 2022 12:49:29 +0000 (UTC)
Date: Fri, 9 Dec 2022 13:49:32 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
In-Reply-To: <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
Message-ID: <alpine.LSU.2.21.2212091348090.18933@pobox.suse.cz>
References: <20220901171252.2148348-1-song@kernel.org> <Y3expGRt4cPoZgHL@alley> <CAPhsuW4qYpX7wzHn5J5Hn9cnOFSZwwQPCjTM_HPTt_zbBS03ww@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Petr Mladek <pmladek@suse.com>, x86@kernel.org, jikos@kernel.org, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > > --- a/kernel/livepatch/core.c
> > > +++ b/kernel/livepatch/core.c
> > > @@ -316,6 +316,45 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
> > >       return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
> > >  }
> > >
> > > +static void klp_clear_object_relocations(struct module *pmod,
> > > +                                     struct klp_object *obj)
> > > +{
> > > +     int i, cnt;
> > > +     const char *objname, *secname;
> > > +     char sec_objname[MODULE_NAME_LEN];
> > > +     Elf_Shdr *sec;
> > > +
> > > +     objname = klp_is_module(obj) ? obj->name : "vmlinux";
> > > +
> > > +     /* For each klp relocation section */
> > > +     for (i = 1; i < pmod->klp_info->hdr.e_shnum; i++) {
> > > +             sec = pmod->klp_info->sechdrs + i;
> > > +             secname = pmod->klp_info->secstrings + sec->sh_name;
> > > +             if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
> > > +                     continue;
> > > +
> > > +             /*
> > > +              * Format: .klp.rela.sec_objname.section_name
> > > +              * See comment in klp_resolve_symbols() for an explanation
> > > +              * of the selected field width value.
> > > +              */
> > > +             secname = pmod->klp_info->secstrings + sec->sh_name;
> > > +             cnt = sscanf(secname, ".klp.rela.%55[^.]", sec_objname);
> > > +             if (cnt != 1) {
> > > +                     pr_err("section %s has an incorrectly formatted name\n",
> > > +                            secname);
> > > +                     continue;
> > > +             }
> 
> Actually, I think we don't need the cnt check here. Once it is removed,
> there isn't much duplicated logic.

Because it must have passed the check once already during 
klp_apply_section_relocs()? Yes, perhaps.

Miroslav
