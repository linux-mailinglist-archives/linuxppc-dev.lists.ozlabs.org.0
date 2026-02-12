Return-Path: <linuxppc-dev+bounces-16820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPaTAXI1jWl70AAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 03:05:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F9129195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 03:05:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBJYB6TPFz2yLH;
	Thu, 12 Feb 2026 13:05:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770861934;
	cv=none; b=QP5yhmpxufYUQZuYiUzBwNMAf4PbPM+w2/PGZecW2sL7uZZjIEX8K+SPpuWlNGlzKVvRh5LLd3QtoVOq0MEKGvM/vIskYD7qanct2KMaD9XmaEi+ioeqAwCEpMfsRupR23llyN+DggLo5BqxZCGcMRfmtY5ym3SMVr+uZjVh4/yA+QZlhUnkxNRLjiRBIa7/STYhORH3+fNIBwtx11j9gNJdaWpvCi2WPiB33/vMDF0sTRj5gPCFqxnxwpPA8IBPTaxrD4+k8ssyauywwrU151PodWHY4MQKgCC2qM2CgoRTzFiYcuXCTgaM01BX8e2sjp/oYqAiq6hW4N5V2FEN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770861934; c=relaxed/relaxed;
	bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OjdmPVvDD7GFfOcMV7o9R5267p1JAQEvs1I75trCrfAsC8R7Uc5gqIZ72cWqFsvu0vdTbLm585wWhtWhSF3AP/h/x+ZxYD2S3epP7vgLJpVP+vJ5q298/LWrUFBbfwqBTiWCSKwLaBmzyvseHGPoKTS5pLUzHe6DUSa4r9UrWfwYDVSpc4Yq5SxTeuDf+QMuDYAQYvEfuPQ089ylEJ4Bm/FcZCOAsCi45Kp4TswIzkh0sRIphrrRfOIE3HY3Jx167stNCGydtpbC8h4bIVYt+Q9rdvKa+AMHcYvR8gfyGfBD37johVgJ5pJMck5t0ytWFzpmaTzi/YAz7E+Hgg4m6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULDh7QcQ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULDh7QcQ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULDh7QcQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ULDh7QcQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBJY96lz3z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 13:05:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770861928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=;
	b=ULDh7QcQOGgvZj2wTFEoOjuxG4CSW61nO1C0xeArzSl5Q8k/eAwJOhFcOlv0KuUwdSUn0D
	kdy083qKTD66V88t0Et4GMkxCkB9ukBB1aoR3l0SwJjds3a2gi1vO9mcvGGckNRsF8StIM
	cA6s4WMAxT67AtNYsjwxkzY/MMOG/fA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770861928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=;
	b=ULDh7QcQOGgvZj2wTFEoOjuxG4CSW61nO1C0xeArzSl5Q8k/eAwJOhFcOlv0KuUwdSUn0D
	kdy083qKTD66V88t0Et4GMkxCkB9ukBB1aoR3l0SwJjds3a2gi1vO9mcvGGckNRsF8StIM
	cA6s4WMAxT67AtNYsjwxkzY/MMOG/fA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-u5XyZFtSP7S7929vLaVAqg-1; Wed, 11 Feb 2026 21:05:26 -0500
X-MC-Unique: u5XyZFtSP7S7929vLaVAqg-1
X-Mimecast-MFC-AGG-ID: u5XyZFtSP7S7929vLaVAqg_1770861926
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso26713185ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 18:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770861925; x=1771466725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PizJXKd85zXyZ9iQQX+Ej3hfH7kGalbAW0kYbFZfhf4=;
        b=Kumut/k9IRplKcPHZ6fCGRClk2LCXC9Vi/Fdi+c/6MlZZjlzw5z1L4u/QsMgqTSxgd
         ay40tQexDWFXTPu75Pqk03T/tt8xYPb7fytcdyKimu9eEvx6OxjJtE8Sj1KTeA0sQRH1
         WEGTLrHuU6/I5BZsht7CMuFTL0FwUpQl3zaJbTSXOnACX2pXbKkUunllCE+MRk5+wclY
         RyXecAcNu8ErmJbSJLdCd96ibtw60oB6NWwP8GSOjSfxoWb6gZqkErevA+8R8nCzM83R
         TTNHmn7ddOWWWNBm0EvNbQKxjR5F3OWyy2MNjDLyisyuicTbXZjDt6RUTSLxr3yFHxxA
         sxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9KZV4rXJi1ZFGhL0WdUr21OSHGBBtTAG8xjv4r50Z73DxpWEBhVX5BTn8ECrQOVoZqg/UOLw06njfZxc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+mSMgW8nXwm1A8M0ajwIlSo1bsIMbUw58I7sFvRXCNDGwyysH
	xSD5GIaLi8lNa5eg2wqPf14NihmXKn12ZSXIt9jYgAsXIF/T5+pPDHxoWFsF0m60c3ZlYRs0i+t
	eZeHqWLqUaGpqrcjVJTYjWLhiZ57YFrOpHmr8n779BCs8eKJIVEU2aEeuE5kLQJpVXN4=
X-Gm-Gg: AZuq6aLBbgaKlQygn/qO459klJEabK96E1mTZ/uOrHkEK7QEy9Pg7to2765H9XCMZCp
	5A36yPKQOdi4L+h52N7i+iWcCEfaOUqxadyMNZY6SEVgorHzvPHgWCeJQmRrfInBZC4wAVMH6Cy
	7U6QJ2jXjQPL4QJP07CikKf+EFeqgfVRx7IFjA9twFciSeiQTjpkEaKNVUK9qvy2oCJAnh5UF1x
	jUY4PepOF/xw4Iqv06sRHRk5rjFA12hFhJFKF4YVHGQ554lToUbs/1EdsAcQCIOZ+Jxn174rd5P
	XnNxhJ+fc2r22rGHr7MQFn9jNwqt1vsCRCFL4MFu/ydXle/m5F4HDyVzSjfYcuhwUGIpMyKOOTs
	Lwj1mW5Ut8YSx
X-Received: by 2002:a17:903:1663:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ab3b1583c5mr6716815ad.9.1770861925459;
        Wed, 11 Feb 2026 18:05:25 -0800 (PST)
X-Received: by 2002:a17:903:1663:b0:2a0:de4f:c99 with SMTP id d9443c01a7336-2ab3b1583c5mr6716465ad.9.1770861924935;
        Wed, 11 Feb 2026 18:05:24 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984c07bsm34405605ad.7.2026.02.11.18.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 18:05:24 -0800 (PST)
Date: Thu, 12 Feb 2026 10:01:58 +0800
From: Coiby Xu <coxu@redhat.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Sourabh Jain <sourabhjain@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Saravana Kannan <saravanak@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] arm64,ppc64le/kdump: pass dm-crypt keys to kdump
 kernel
Message-ID: <aY0uGN67vdEP2b_F@Rk>
References: <20260211082401.2407853-1-coxu@redhat.com>
 <20260211082401.2407853-3-coxu@redhat.com>
 <423a3431-1271-4c35-94fe-8ca880679ed9@kernel.org>
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
MIME-Version: 1.0
In-Reply-To: <423a3431-1271-4c35-94fe-8ca880679ed9@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bdiRqbC6xk6O_sgJVG8pVo0VLrmLZDEl8NA9aet2cT0_1770861926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16820-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:arnaud.lefebvre@clever-cloud.com,m:bhe@redhat.com,m:dyoung@redhat.com,m:ryncsn@gmail.com,m:kernelfans@gmail.com,m:akpm@linux-foundation.org,m:krzk@kernel.org,m:robh@kernel.org,m:tstaudt@de.ibm.com,m:sourabhjain@linux.ibm.com,m:will@kernel.org,m:catalin.marinas@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:saravanak@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,lists.ozlabs.org,vger.kernel.org,clever-cloud.com,redhat.com,gmail.com,linux-foundation.org,kernel.org,de.ibm.com,linux.ibm.com,arm.com,ellerman.id.au];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 284F9129195
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:55:17AM +0100, Christophe Leroy (CS GROUP) wrote:
>
>
>Le 11/02/2026 à 09:24, Coiby Xu a écrit :
>>CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>>device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>>To also enable this feature for ARM64 and PowerPC, we only need to add
>
>What do you want to say exactly with 'only' ?

Hi Christophe,

Thanks for raising the question! To clarify, CONFIG_CRASH_DM_CRYPT
provides the framework to address these challenges for LUKS-encrypted
dump target. Since the heavy lifting is handled in the arch-independent
code, we only need to...

If it looks good to you, I'll rephrase it as "To also enable this
feature for ARM64 and PowerPC, the missing piece is to let the kdump
kernel know where to find the dm-crypt keys which are randomly stored in
memory reserved for kdump. I'll introduce a new device tree property
dmcryptkeys ...".

>
>>a device tree property dmcryptkeys [2] as similar to elfcorehdr to pass
>>the memory address of the stored info of dm-crypt keys to the kdump
>>kernel. Since this property is only needed by the kdump kernel, it won't
>>be exposed to user space.
>>
>>[1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250502011246.99238-1-coxu%40redhat.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C0aa5f3b34d694b23b0cc08de6946f66c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639063950684962054%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=8uCc%2Bg6YNojymf8UpZhmJY19vpWXJCC9KIf3qMyQ3dI%3D&reserved=0
>>[2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fdevicetree-org%2Fdt-schema%2Fpull%2F181&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C0aa5f3b34d694b23b0cc08de6946f66c%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639063950684987003%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=1s5NPHgF1LsXdrDXBhawduFXOqnHPlkbohQHHvolLw4%3D&reserved=0
>>
>>Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>>Cc: Baoquan he <bhe@redhat.com>
>>Cc: Dave Young <dyoung@redhat.com>
>>Cc: Kairui Song <ryncsn@gmail.com>
>>Cc: Pingfan Liu <kernelfans@gmail.com>
>>Cc: Andrew Morton <akpm@linux-foundation.org>
>>Cc: Krzysztof Kozlowski <krzk@kernel.org>
>>Cc: Rob Herring <robh@kernel.org>
>>Cc: Thomas Staudt <tstaudt@de.ibm.com>
>>Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Cc: Will Deacon <will@kernel.org>
>>Signed-off-by: Coiby Xu <coxu@redhat.com>
>>---
>>  arch/arm64/kernel/machine_kexec_file.c |  4 ++++
>>  arch/powerpc/kexec/elf_64.c            |  4 ++++
>>  drivers/of/fdt.c                       | 21 +++++++++++++++++++++
>>  drivers/of/kexec.c                     | 19 +++++++++++++++++++
>>  4 files changed, 48 insertions(+)
>>
>>diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>>index 331646d667b9..2967e4aff807 100644
>>--- a/drivers/of/fdt.c
>>+++ b/drivers/of/fdt.c
>>@@ -866,6 +866,26 @@ static void __init early_init_dt_check_for_elfcorehdr(unsigned long node)
>>  		 elfcorehdr_addr, elfcorehdr_size);
>>  }
>>+static void __init early_init_dt_check_for_dmcryptkeys(unsigned long node)
>>+{
>>+	const char *prop_name = "linux,dmcryptkeys";
>>+	const __be32 *prop;
>>+
>>+	if (!IS_ENABLED(CONFIG_CRASH_DM_CRYPT))
>>+		return;
>>+
>>+	pr_debug("Looking for dmcryptkeys property... ");
>>+
>>+	prop = of_get_flat_dt_prop(node, prop_name, NULL);
>>+	if (!prop)
>>+		return;
>>+
>>+	dm_crypt_keys_addr = dt_mem_next_cell(dt_root_addr_cells, &prop);
>>+
>>+	/* Property only accessible to crash dump kernel */
>>+	fdt_delprop(initial_boot_params, node, prop_name);
>
>Shouldn't this property be deleted regardless of whether kernel is 
>built with CONFIG_CRASH_DM_CRYPT or without ?

This property will be created only if 1) CONFIG_CRASH_DM_CRYPT is
enabled and 2) the dump target is LUKS-encrypted. So there is no need to
delete it if it doesn't exist at all.

>
>>+}
>>+
>>  static unsigned long chosen_node_offset = -FDT_ERR_NOTFOUND;
>>  /*
>>@@ -1097,6 +1117,7 @@ int __init early_init_dt_scan_chosen(char *cmdline)
>>  	early_init_dt_check_for_initrd(node);
>>  	early_init_dt_check_for_elfcorehdr(node);
>>+	early_init_dt_check_for_dmcryptkeys(node);
>>  	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
>>  	if (rng_seed && l > 0) {
>

-- 
Best regards,
Coiby


