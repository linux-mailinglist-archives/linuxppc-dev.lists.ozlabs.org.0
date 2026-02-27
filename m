Return-Path: <linuxppc-dev+bounces-17406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APIFMInXoWlcwgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 18:42:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D771BB909
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 18:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMwdJ3zrXz2xYw;
	Sat, 28 Feb 2026 04:42:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772214148;
	cv=none; b=XITcJ7qeAl/6W6x9leUG+SuKHPDO+8HwoWU1/Bf6ivTGiHMrGu1fwc0WDpQ5clqM1b0XuJljtauEj3OCzQldbr4tVgpOjlS7d3O24N/KL01bBmeg/XlOfILoe+h4U0fpDZuGqE+1l2ot5I+N3SyrTkI3MTRm1CeCnPYSAUoYgk136Fn2SokWkfM212jrR/Ln+mf2SOSO5v++u8vFMfiDY+xjflmMbuDXjs0LbjsahlIKpYO9M9XCt/PHHk6T4BGG2o4nOhlqbL35Umf1woYXyGNFsx03OjBD7nfWWGS6uBsZJ1VlYSpdNYh7NdaKG7oINMQOnTVgZphvkujgZo0RWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772214148; c=relaxed/relaxed;
	bh=Et77aHJTeuGzmmNrAkPK/DYt1o94w5tXvKsba6OelYM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=K78d380garwIOY9YhmM7q1HGoA1dofSTh71OvkrOKnbvHlR4SCBCaMtzjcgRx29q8/YsZVpsMj6ONM9VsDgUnY/TuM8K/FQ6+QKQo+04SPk3ZKy96CLDXZcl2n8F9a4XvX0pW8ssJxXZ/hd+xf2tjlmttUY6uaidmiZqubAJczXf/l39vMXWTu/o6Hn+Ofii4493roXDmGvFJz7rL/uaYGpHDeQLgBjLkto5D8jc9I7jjqQawod5YzW5ZDdAMuswY3zHYZyLWKcW0LJPhV6Mm5KVqo9lUgRdobK7HrND+UhGpgbH5YAPdqRHLbrDffvVQmLCW4bmX33EqpgemTgAmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XCpzIZK+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XCpzIZK+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMwdG6n1Sz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 04:42:25 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so25275495ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 09:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772214142; x=1772818942; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et77aHJTeuGzmmNrAkPK/DYt1o94w5tXvKsba6OelYM=;
        b=XCpzIZK+TivE0WMm9fwaqGru/tBXzHiwKZ3FP8MKiSoIaFCg4zhQfuMfg8ws3uaenK
         W4jiDKhNfriVYwU6tiQmwM9uT6/DajpLM+JjOGkESiRixLMqDHILcejT+sFlgcgX7pxv
         GfhfPJcvi+6N8C2FBAt/FigNYHuEG3zjoFXt0/lJH/oeTuI5B1yn8cCLsap2rkedMmLg
         nDwHne96CUal1OuhSRMIb9i3pvUga0XkDG5HCOyyH8y5aaLawS3ZsfWtlviegtGAvs59
         DaawDLOy4JOUcc4TjTNi43uacM3GSYhvXUkYN/n9196dYrGdmVueg1Qnh15XqniFLDUI
         wyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772214142; x=1772818942;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Et77aHJTeuGzmmNrAkPK/DYt1o94w5tXvKsba6OelYM=;
        b=XToa1XqaNBFfm4UxKS+wgNNYd4uqpEztSJoCBt/gllR4UkvvIbX/qg3LnCyctpSlOO
         XN6dBqSG4Q3LaeylNmBP/6uMfBVtXzQEYer0F3i2T6MABma4MTjq6nSQNAE9dx398eRD
         ISWt4cCPcD4SppKvYD446dbUcWJygtfFHai6Nxa4mHPC22cZfztSH8/myo3rLsRz2NWK
         vCTzG+mnsNwTchvy1L1sN2/SoSit6vJHrxvjs0a0bcZ9prNlJrWkCJX0RP5RhgE9jZM9
         5o8ki12kK4h0Lup5h27PVwEzlemDgTDacIlYDBRamCCb8qonzV40fg8SV4WGN+xNmWL8
         enPw==
X-Forwarded-Encrypted: i=1; AJvYcCW2MtwRtMmbLySKMccOduu4Z+L63dmYV1QYHhPTZnXaVIJemaWNIlRVYxfI2xuBlbgnXiWnkNWj8mtJDIg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yya3/4Zudc8J7joyjaw+hDOrVVywSlRPlnM9GIMMfNNdO1uhg1+
	PttajhDM3PYbSbdI+tskyu2tNWbrdC/55jfLIbzv+XKQGEqPGl+lG6Ye
X-Gm-Gg: ATEYQzzAEn177+4uRucyrYxv76vlJpKLPfvGvHOZ+kSyZ+HqoZiyIBKzRoCkQBoTQ4S
	y8equtFpbxM1QBIOyBc9Eo5YFWIe34/Gb8gaoaZSuN8mJ/+s9BH/PvWczEOFaezQ8Ffg7k/bZox
	JIvSCTcFfDkEUgvwe9xPdYI2V8rOb1CjQEvz32KFHH+rXqlw0A/EWxmkSSw57/YxpUIxzfV3zzA
	Pp7FCq0gigFJQPpm5Du5wcNgZxjaKPOCp2MfWTB7I52SV9pqS3UPuTgWo0Bg65qAF1YxV9Fv+JT
	PNCZ+ofcNFpokEIHcqFx6ydfeqQXt703byBAzvzts1HXjQWahkl7MUja2rzc/mStsfrsCxgTYq0
	Tt8R/CxhvDo2BZEDoulMm4wgXg007M1k3o+Txuact+tqx6WHSzxUuh5MYsz3brXti3nzgON47y9
	wniLrHYuwvMZmYlGf02E1ptrJfBewZ
X-Received: by 2002:a17:902:f647:b0:2aa:d350:fbf0 with SMTP id d9443c01a7336-2ae2e4a5ff3mr42125155ad.26.1772214142121;
        Fri, 27 Feb 2026 09:42:22 -0800 (PST)
Received: from dw-tp ([171.76.229.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b974csm58040095ad.65.2026.02.27.09.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:42:21 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-mm@kvack.org
Subject: Re: powerpc/fadump: CMA init is failing
In-Reply-To: <4c338a29-d190-44f3-8874-6cfa0a031f0b@linux.ibm.com>
Date: Fri, 27 Feb 2026 22:39:53 +0530
Message-ID: <87o6lagljy.ritesh.list@gmail.com>
References: <4c338a29-d190-44f3-8874-6cfa0a031f0b@linux.ibm.com>
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
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17406-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:mpe@ellerman.id.au,m:rppt@kernel.org,m:donettom@linux.ibm.com,m:hbathini@linux.ibm.com,m:mahesh@linux.ibm.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[54.174.64.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,1.201.195.198:email]
X-Rspamd-Queue-Id: A8D771BB909
X-Rspamd-Action: no action

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> I noticed CMA init for fadump crashkernel memory is failing.
>
> [    0.000000] cma: pageblock_order not yet initialized. Called during 
> early boot?
> [    0.000000] fadump: Failed to init cma area for firmware-assisted 
> dump,-22
>
>
> kernel command-line:
> BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000070/disk@8100000000000000,msdos2)/vmlinuz-7.0.0-rc1+ 
> root=/dev/mapper/rhel_ltcden3--lp12-root ro 
> rd.lvm.lv=rhel_ltcden3-lp12/root rd.lvm.lv=rhel_ltcden3-lp12/swap 
> fadump=on crashkernel=3G
>
>
> Same issue with kdump CMA reservation:
>
> [    0.000000][    T0] cma: pageblock_order not yet initialized. Called 
> during early boot?

Good that we added those debug prints ;)

I think I know what went wrong, as part of this arch,mm consolidation
patch series [1], I think the order of initialization is changed.

With this patch the new order is ... 
start_kernel()
    - setup_arch()
       - xxx_cma_reserve();
    - mm_core_init_early()
       - free_area_init()
          - sparse_init()
             - set_pageblock_order() // this sets the pageblock_order.

Whereas earlier set_pageblock_order() was called from initmem_init(),
just before cma reservations were being made. 

start_kernel()
    - setup_arch()
       - initmem_init()
         - sparse_init()
           - set_pageblock_order();  // this sets the pageblock_order
       - xxx_cma_reserve();

So that means, pageblock_order is not initialized before these cma
reservation function calls, hence we are seeing these failures.

setup_arch() {
    ...

	/*
	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
	 * hugetlb. These must be called after initmem_init(), so that
	 * pageblock_order is initialised.
	 */
	fadump_cma_init();
	kdump_cma_reserve();
	kvm_cma_reserve();

    ...
}


So what if we do.. 

start_kernel() {
  ...
	setup_arch(&command_line);
	mm_core_init_early();
    setup_arch_post_mm_core_init(); // and here we call CMA reservation functions ?


References:
[1]: https://lore.kernel.org/linuxppc-dev/20260111082105.290734-1-rppt@kernel.org/T/#m5adf1a845e0a0867066c4f7055f28e6304b73fa5
[2]: https://lore.kernel.org/all/3ae208e48c0d9cefe53d2dc4f593388067405b7d.1729146153.git.ritesh.list@gmail.com/


-ritesh

