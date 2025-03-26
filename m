Return-Path: <linuxppc-dev+bounces-7333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673FDA70E6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 02:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMq2x3q2vz2xQ8;
	Wed, 26 Mar 2025 12:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742951829;
	cv=none; b=A82ALCX1xpsgcw7ewHZbY2i2CLMsq1XsEJl8f5Et9f+NWbCiUMJLX2uD6P/lHved79qLgUXlYeJ9pJjeIanVhjm2sKHCqC2w/NT4rgZDaFeYdb4VSlfcHdjlOCATWaZYPttosgvBNs60bpLrwO/hSLVvn6XMH0OsFzosceVEv19DD61ciXOJmimGkChAZvXncvDdSToZ7vQL3QdCkTUofTqchVX1qjkWJRrhFklQf4Yk+sXqIeTg9Wfedp+J6pDXdTBCDQVGuX7HUcqF/rF6mQg7E8AO9esUYO7q8q2Xa+3ZDwOvDjKkQBmgd+BVSgN5RDKQIAQ/8oCOd/L0tBdJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742951829; c=relaxed/relaxed;
	bh=VtsoN8EDTTOJU5HgLXs5HycSeqen7K6iRMRpAvz6dyU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M3QFbCLolXssf8i0c3u8mGzf+AflMPQyuTF5kyT5eFpIr0pvouJiO8vQC5EIetnma+t9DqaGVV8WCNioEiUdex0VcmyNphMoQaWK6tCqwdyu/LlkT5gBROgXS8QjUkper8M6m5FquhRVZoZ2bRfG27g8rI0yCJxmYpmuRZ0DXaNvwXMlf7iD4sXddXOLcnlqoUyQl0/Dd5fuLEOeLs6t4KrtBD10afZuJxCGiPC4dWEYGuCq/CD0q6wNeb1s/ZFTCmOAWrkunKPCIhJun9Nn7Pdtw0D2DinolEfGoBnX/+9bkcWqBEp6ERUyNtg4VZO/HhZNJjLWc1T/ZHFzvDRgTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OlO6/1uD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OlO6/1uD; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=awilliam@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OlO6/1uD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OlO6/1uD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=awilliam@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMpmL6xNxz2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Mar 2025 12:17:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742951819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtsoN8EDTTOJU5HgLXs5HycSeqen7K6iRMRpAvz6dyU=;
	b=OlO6/1uD/aWZ3Mo0BGOAg+CfUZbQ1PscZQ/HT1qaXVMnNhvo5cNzuaOP+PI25buiSv9Sk4
	ZA2fdRuWUM7+vldDgu0/+zGFAlpFCTZ/nr9RyqVbz9oBELSlELoHHy8l3C0aTQXDwI7/Wm
	NLBLCMrTBzFglyMeYJdPsNjMByiJQvk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742951819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VtsoN8EDTTOJU5HgLXs5HycSeqen7K6iRMRpAvz6dyU=;
	b=OlO6/1uD/aWZ3Mo0BGOAg+CfUZbQ1PscZQ/HT1qaXVMnNhvo5cNzuaOP+PI25buiSv9Sk4
	ZA2fdRuWUM7+vldDgu0/+zGFAlpFCTZ/nr9RyqVbz9oBELSlELoHHy8l3C0aTQXDwI7/Wm
	NLBLCMrTBzFglyMeYJdPsNjMByiJQvk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-IGB1RthKONuxiMYqTtFXNw-1; Tue, 25 Mar 2025 21:16:57 -0400
X-MC-Unique: IGB1RthKONuxiMYqTtFXNw-1
X-Mimecast-MFC-AGG-ID: IGB1RthKONuxiMYqTtFXNw_1742951817
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ed0cc28f7dso36898446d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 18:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742951817; x=1743556617;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtsoN8EDTTOJU5HgLXs5HycSeqen7K6iRMRpAvz6dyU=;
        b=ucU32vOKxhBJimNj9/oEfRGozZ3y+u3iGHncWu2RV5+Jo4uNRQGzRxYJiJCD0gXxb1
         0/Zy7XoFGTCXagucQ7QGdjFEG8DDBFcniN8Eu5a4l+0zsyXz2Po/5HuA7p8HjCLSTXR3
         aSE6EVCLvFK9/LfgSJNgm+A+WPubGrarlgyKv4ZHLwZfJEpPrYQXxDQYGbLfhYopCtxx
         1wR10dGPPkGKrHeeQcPEhtddXtmo3izadiORlGPxkaZRleHRE5RUmzJsEWj8ToQZIGsG
         g/iHK8dh0LbnmYttzBOby1OmwTyfQBfEdA8ednHd0u36DSw8AVZhXlGL3rzrJA69kWkb
         BSQQ==
X-Gm-Message-State: AOJu0YzMtMs4ysAij1yr85JCeHpM3atRjoEskcnn/bIyEU87qa5poE6h
	J/+dzXb4VZWQC9v10PVZke/RMywE/y9+uI+jTbkJ4WbpfVlnsKo0afiH0gTH4l3lyl/vLTWlTr1
	gPBl7E0Ils+fkKm+ZvGNVsZO0rEfoSdPsZYzvqv7UmJXxh2c2ciY7PWKsZPFqPQ==
X-Gm-Gg: ASbGnct+lqjeU+ivfHaXxq7dm2iR2HZyR033ZiHWeJ2oYmXjpUe43X0KIZ+PWhJ0Xp8
	GAmfNRasMeVjKaiszb7eBYCeqtuGuvxegacMve8Q6PqXETHr1CtlmJGClDkyOAfKApQQscAIcjQ
	8iBzZvdRvcGNlHkrU36Q2dy+Vf0H2ElwnFIQ0V9P6k6vSXwh1d7Qi0vTIt+TUQCtnJRrfquT0va
	GCqdYnFrdQyhZfiMCCkcReaWloRFr5ylTz/FJfaoQ1nVGXOKxFPxUYCgA1SnjO/Eezc2xGmyx7c
	55F3EIZMjZnlSLSlWkRMVG971pC3tjBGCAyk
X-Received: by 2002:a05:6214:e8f:b0:6d4:25c4:e775 with SMTP id 6a1803df08f44-6eb3f2e6b0fmr349284816d6.15.1742951816768;
        Tue, 25 Mar 2025 18:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvsfn2r1AiZMX09SfJrKIqy2FC/7pO0yvZpolQSNnvLEQAd2meDrR5S3GfrYKTB4/t/HC/iw==
X-Received: by 2002:a05:6214:e8f:b0:6d4:25c4:e775 with SMTP id 6a1803df08f44-6eb3f2e6b0fmr349284406d6.15.1742951816285;
        Tue, 25 Mar 2025 18:16:56 -0700 (PDT)
Received: from omnibook.happyassassin.net ([2001:569:7cd5:ea00:c6fc:c4e9:3726:7db0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0ed51sm62108886d6.6.2025.03.25.18.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 18:16:55 -0700 (PDT)
Message-ID: <89748fc85c6ca477f64e1a5cc1852e74c68b493c.camel@redhat.com>
Subject: Re: [PATCH] powerpc64/ftrace: fix module loading without patchable
 function entries
From: Adam Williamson <awilliam@redhat.com>
To: Naveen N Rao <naveen@kernel.org>, Anthony Iliopoulos <ailiop@suse.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	jforbes@redhat.com, kevin@scrye.com
Date: Tue, 25 Mar 2025 18:16:53 -0700
In-Reply-To: <wlscshbqan2svtqkz5xc6v47tzndfnsvge7h4lbfn67zoplekl@elt2oxwhrp6f>
References: <20250204231821.39140-1-ailiop@suse.com>
	 <wlscshbqan2svtqkz5xc6v47tzndfnsvge7h4lbfn67zoplekl@elt2oxwhrp6f>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BM6ckOYXjEYTTId6Ho5uDVAA1vNz5cNJQdCxL4qO03g_1742951817
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-02-13 at 22:29 +0530, Naveen N Rao wrote:
> On Wed, Feb 05, 2025 at 12:18:21AM +0100, Anthony Iliopoulos wrote:
> > get_stubs_size assumes that there must always be at least one patchable
> > function entry, which is not always the case (modules that export data
> > but no code), otherwise it returns -ENOEXEC and thus the section header
> > sh_size is set to that value. During module_memory_alloc() the size is
> > passed to execmem_alloc() after being page-aligned and thus set to zero
> > which will cause it to fail the allocation (and thus module loading) as
> > __vmalloc_node_range() checks for zero-sized allocs and returns null:
> >=20
> > [  115.466896] module_64: cast_common: doesn't contain __patchable_func=
tion_entries.
> > [  115.469189] ------------[ cut here ]------------
> > [  115.469496] WARNING: CPU: 0 PID: 274 at mm/vmalloc.c:3778 __vmalloc_=
node_range_noprof+0x8b4/0x8f0
> > ...
> > [  115.478574] ---[ end trace 0000000000000000 ]---
> > [  115.479545] execmem: unable to allocate memory
>=20
> Ugh, that's nasty.
>=20
> >=20
> > Fix this by removing the check completely, since it is anyway not
> > helpful to propagate this as an error upwards.
> >=20
> > Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of lin=
e")
> > Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
> > ---
> >  arch/powerpc/kernel/module_64.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >=20
>=20
> Thanks for fixing this. It might also be good to add a check in=20
> setup_ftrace_ool_stubs(). Something like this:
>=20
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module=
_64.c
> index 34a5aec4908f..c10a9c66cfe3 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -1125,6 +1125,10 @@ static int setup_ftrace_ool_stubs(const Elf64_Shdr=
 *sechdrs, unsigned long addr,
>         unsigned int i, total_stubs, num_stubs;
>         struct ppc64_stub_entry *stub;
> =20
> +       /* Bail out early if no traceable functions */
> +       if (!me->arch.ool_stub_count)
> +               return 0;
> +
>         total_stubs =3D sechdrs[me->arch.stubs_section].sh_size / sizeof(=
*stub);
>         num_stubs =3D roundup(me->arch.ool_stub_count * sizeof(struct ftr=
ace_ool_stub),
>                             sizeof(struct ppc64_stub_entry)) / sizeof(str=
uct ppc64_stub_entry);
>=20
>=20
> Regardless of that, for this patch:
> Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>
>=20
>=20
> - Naveen
>=20
Is there anything that can be done to get this bumped along? It
completely breaks networking on Fedora's power9 boxes, as it affects
the i40e module which they use.

Thanks!
--=20
Adam Williamson (he/him/his)
Fedora QA
Fedora Chat: @adamwill:fedora.im | Mastodon: @adamw@fosstodon.org
https://www.happyassassin.net





