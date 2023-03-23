Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 708BF6C6A72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 15:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj6cx2hWkz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 01:08:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8LCti+0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8LCti+0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8LCti+0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J8LCti+0;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj6bw4tFVz3cjM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 01:07:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679580440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRvpalBWPqMhv6mTwhRPg9Z49O8olbGgMd78XcEZW2M=;
	b=J8LCti+0Fxew5H4ixzavxfRQSeg/nq1eBwpfIAuZLu5baGa9lDCaR6QDmeOu8fO84J+sG1
	xJeHzXJhLqCOz/eR5AeyfZlYnORbce4td31DJFaj5HPY2txERpggZ+kOWQceVOGA7hm24e
	lDSTzR2cbgfO4IX0MEaYLOJs8u3NrKA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679580440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRvpalBWPqMhv6mTwhRPg9Z49O8olbGgMd78XcEZW2M=;
	b=J8LCti+0Fxew5H4ixzavxfRQSeg/nq1eBwpfIAuZLu5baGa9lDCaR6QDmeOu8fO84J+sG1
	xJeHzXJhLqCOz/eR5AeyfZlYnORbce4td31DJFaj5HPY2txERpggZ+kOWQceVOGA7hm24e
	lDSTzR2cbgfO4IX0MEaYLOJs8u3NrKA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-pWUOx6nvNriIZ_cXLyq47Q-1; Thu, 23 Mar 2023 10:07:18 -0400
X-MC-Unique: pWUOx6nvNriIZ_cXLyq47Q-1
Received: by mail-wm1-f71.google.com with SMTP id o7-20020a05600c4fc700b003edf85f6bb1so1082167wmq.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 07:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679580437;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRvpalBWPqMhv6mTwhRPg9Z49O8olbGgMd78XcEZW2M=;
        b=BL9jaj0lVCB13f5/B0yc4oTp/0BnELxT/jxirFfPLQzewNFaGAaTxtC+U8rqW9nXvc
         sybVwNs/NnqqGXjQAc0kPpTUpCpLeBk0CiEfdbnEBKo2w3F4Z8H6eG9y/8M2iNU874sh
         wbpGNcCCsDWyqfVSYrhEU141gBbbZ+eUv9RVUyyG9AtQnv4rJBWouIEpSeyczzr457i1
         4FluQJ8qoGtwJDVzWHCj30Yo15Y6Ahj13B6czzxXSS0y3Hn1N3D6qBmlRRhmD0rbuYFH
         4h4CopTYXzieBC9yWx/3BtaublGPGUVZy8SwW/28UgKjXseO72dccjLo1p/zBrYdlxGP
         4j5g==
X-Gm-Message-State: AO0yUKXH4q8J6606omZQz9GEI0nrPoK6SF95K/HMLb5O5L2aUxl4fyNA
	y+xl1EJubyzhvCr6sSKvCrLwEeXUASRzSeAL38aVeCAmAGHFytsKCvu2sdPvpRrY00jmsqfvzKA
	x3zAmPciaxBwBeHRksE+CxaOhbA==
X-Received: by 2002:a05:600c:2202:b0:3ed:29f7:5b43 with SMTP id z2-20020a05600c220200b003ed29f75b43mr2371454wml.27.1679580437490;
        Thu, 23 Mar 2023 07:07:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set9KIl7q+bmnKehrAC4rbgA9iW7yJciDLCNLe9sT8+09ZC/jqRaq1+K8mh12VAS9MYY8kodAjQ==
X-Received: by 2002:a05:600c:2202:b0:3ed:29f7:5b43 with SMTP id z2-20020a05600c220200b003ed29f75b43mr2371433wml.27.1679580437180;
        Thu, 23 Mar 2023 07:07:17 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d4344000000b002c5526234d2sm16452365wrr.8.2023.03.23.07.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:07:16 -0700 (PDT)
Message-ID: <e10767db-95c2-18a2-aa9a-a055844570ac@redhat.com>
Date: Thu, 23 Mar 2023 15:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-8-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests v2 07/10] powerpc/spapr_vpa: Add basic VPA tests
In-Reply-To: <20230320070339.915172-8-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/03/2023 08.03, Nicholas Piggin wrote:
> The VPA is a(n optional) memory structure shared between the hypervisor
> and operating system, defined by PAPR. This test defines the structure
> and adds registration, deregistration, and a few simple sanity tests.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/linux/compiler.h    |  2 +
>   lib/powerpc/asm/hcall.h |  1 +
>   lib/ppc64/asm/vpa.h     | 62 ++++++++++++++++++++++++++++
>   powerpc/Makefile.ppc64  |  2 +-
>   powerpc/spapr_vpa.c     | 90 +++++++++++++++++++++++++++++++++++++++++

Please add the new test to powerpc/unittests.cfg, otherwise it won't get 
picked up by the run_tests.sh script.

> diff --git a/lib/linux/compiler.h b/lib/linux/compiler.h
> index 6f565e4..c9d205e 100644
> --- a/lib/linux/compiler.h
> +++ b/lib/linux/compiler.h
> @@ -45,7 +45,9 @@
>   
>   #define barrier()	asm volatile("" : : : "memory")
>   
> +#ifndef __always_inline
>   #define __always_inline	inline __attribute__((always_inline))
> +#endif

What's this change good for? ... it doesn't seem to be related to this patch?

> diff --git a/lib/ppc64/asm/vpa.h b/lib/ppc64/asm/vpa.h
> new file mode 100644
> index 0000000..11dde01
> --- /dev/null
> +++ b/lib/ppc64/asm/vpa.h
> @@ -0,0 +1,62 @@
> +#ifndef _ASMPOWERPC_VPA_H_
> +#define _ASMPOWERPC_VPA_H_
> +/*
> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +
> +#ifndef __ASSEMBLY__
> +
> +struct vpa {
> +	uint32_t	descriptor;
> +	uint16_t	size;
> +	uint8_t		reserved1[3];
> +	uint8_t		status;

Where does this status field come from? ... My LoPAPR only says that there 
are 18 "reserved" bytes in total here.

> +	uint8_t		reserved2[14];
> +	uint32_t	fru_node_id;
> +	uint32_t	fru_proc_id;
> +	uint8_t		reserved3[56];
> +	uint8_t		vhpn_change_counters[8];
> +	uint8_t		reserved4[80];
> +	uint8_t		cede_latency;
> +	uint8_t		maintain_ebb;
> +	uint8_t		reserved5[6];
> +	uint8_t		dtl_enable_mask;
> +	uint8_t		dedicated_cpu_donate;
> +	uint8_t		maintain_fpr;
> +	uint8_t		maintain_pmc;
> +	uint8_t		reserved6[28];
> +	uint64_t	idle_estimate_purr;
> +	uint8_t		reserved7[28];
> +	uint16_t	maintain_nr_slb;
> +	uint8_t		idle;
> +	uint8_t		maintain_vmx;
> +	uint32_t	vp_dispatch_count;
> +	uint32_t	vp_dispatch_dispersion;
> +	uint64_t	vp_fault_count;
> +	uint64_t	vp_fault_tb;
> +	uint64_t	purr_exprop_idle;
> +	uint64_t	spurr_exprop_idle;
> +	uint64_t	purr_exprop_busy;
> +	uint64_t	spurr_exprop_busy;
> +	uint64_t	purr_donate_idle;
> +	uint64_t	spurr_donate_idle;
> +	uint64_t	purr_donate_busy;
> +	uint64_t	spurr_donate_busy;
> +	uint64_t	vp_wait3_tb;
> +	uint64_t	vp_wait2_tb;
> +	uint64_t	vp_wait1_tb;
> +	uint64_t	purr_exprop_adjunct_busy;
> +	uint64_t	spurr_exprop_adjunct_busy;

The above two fields are also marked as "reserved" in my LoPAPR ... which 
version did you use?

> +	uint32_t	supervisor_pagein_count;
> +	uint8_t		reserved8[4];
> +	uint64_t	purr_exprop_adjunct_idle;
> +	uint64_t	spurr_exprop_adjunct_idle;
> +	uint64_t	adjunct_insns_executed;

dito for the above three lines... I guess my LoPAPR is too old...

> +	uint8_t		reserved9[120];
> +	uint64_t	dtl_index;
> +	uint8_t		reserved10[96];
> +};
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASMPOWERPC_VPA_H_ */
> diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
> index ea68447..b0ed2b1 100644
> --- a/powerpc/Makefile.ppc64
> +++ b/powerpc/Makefile.ppc64
> @@ -19,7 +19,7 @@ reloc.o  = $(TEST_DIR)/reloc64.o
>   OBJDIRS += lib/ppc64
>   
>   # ppc64 specific tests
> -tests =
> +tests = $(TEST_DIR)/spapr_vpa.elf
>   
>   include $(SRCDIR)/$(TEST_DIR)/Makefile.common
>   
> diff --git a/powerpc/spapr_vpa.c b/powerpc/spapr_vpa.c
> new file mode 100644
> index 0000000..45688fe
> --- /dev/null
> +++ b/powerpc/spapr_vpa.c
> @@ -0,0 +1,90 @@
> +/*
> + * Test sPAPR hypervisor calls (aka. h-calls)

Adjust to "Test sPAPR H_REGISTER_VPA hypervisor call" ?

> + * This work is licensed under the terms of the GNU LGPL, version 2.
> + */
> +#include <libfdt/libfdt.h>
> +#include <devicetree.h>
> +#include <libcflat.h>
> +#include <util.h>
> +#include <alloc.h>
> +#include <asm/processor.h>
> +#include <asm/hcall.h>
> +#include <asm/vpa.h>
> +#include <asm/io.h> /* for endian accessors */
> +
> +static void print_vpa(struct vpa *vpa)
> +{
> +	printf("VPA\n");
> +	printf("descriptor:			0x%08x\n", be32_to_cpu(vpa->descriptor));
> +	printf("size:				    0x%04x\n", be16_to_cpu(vpa->size));
> +	printf("status:				      0x%02x\n", vpa->status);
> +	printf("fru_node_id:			0x%08x\n", be32_to_cpu(vpa->fru_node_id));
> +	printf("fru_proc_id:			0x%08x\n", be32_to_cpu(vpa->fru_proc_id));
> +	printf("vhpn_change_counters:		0x%02x %02x %02x %02x %02x %02x %02x %02x\n", vpa->vhpn_change_counters[0], vpa->vhpn_change_counters[1], vpa->vhpn_change_counters[2], vpa->vhpn_change_counters[3], vpa->vhpn_change_counters[4], vpa->vhpn_change_counters[5], vpa->vhpn_change_counters[6], vpa->vhpn_change_counters[7]);
> +	printf("vp_dispatch_count:		0x%08x\n", be32_to_cpu(vpa->vp_dispatch_count));
> +	printf("vp_dispatch_dispersion:		0x%08x\n", be32_to_cpu(vpa->vp_dispatch_dispersion));
> +	printf("vp_fault_count:			0x%08lx\n", be64_to_cpu(vpa->vp_fault_count));
> +	printf("vp_fault_tb:			0x%08lx\n", be64_to_cpu(vpa->vp_fault_tb));
> +	printf("purr_exprop_idle:		0x%08lx\n", be64_to_cpu(vpa->purr_exprop_idle));
> +	printf("spurr_exprop_idle:		0x%08lx\n", be64_to_cpu(vpa->spurr_exprop_idle));
> +	printf("purr_exprop_busy:		0x%08lx\n", be64_to_cpu(vpa->purr_exprop_busy));
> +	printf("spurr_exprop_busy:		0x%08lx\n", be64_to_cpu(vpa->spurr_exprop_busy));
> +	printf("purr_donate_idle:		0x%08lx\n", be64_to_cpu(vpa->purr_donate_idle));
> +	printf("spurr_donate_idle:		0x%08lx\n", be64_to_cpu(vpa->spurr_donate_idle));
> +	printf("purr_donate_busy:		0x%08lx\n", be64_to_cpu(vpa->purr_donate_busy));
> +	printf("spurr_donate_busy:		0x%08lx\n", be64_to_cpu(vpa->spurr_donate_busy));
> +	printf("vp_wait3_tb:			0x%08lx\n", be64_to_cpu(vpa->vp_wait3_tb));
> +	printf("vp_wait2_tb:			0x%08lx\n", be64_to_cpu(vpa->vp_wait2_tb));
> +	printf("vp_wait1_tb:			0x%08lx\n", be64_to_cpu(vpa->vp_wait1_tb));
> +	printf("purr_exprop_adjunct_busy:	0x%08lx\n", be64_to_cpu(vpa->purr_exprop_adjunct_busy));
> +	printf("spurr_exprop_adjunct_busy:	0x%08lx\n", be64_to_cpu(vpa->spurr_exprop_adjunct_busy));
> +	printf("purr_exprop_adjunct_idle:	0x%08lx\n", be64_to_cpu(vpa->purr_exprop_adjunct_idle));
> +	printf("spurr_exprop_adjunct_idle:	0x%08lx\n", be64_to_cpu(vpa->spurr_exprop_adjunct_idle));
> +	printf("adjunct_insns_executed:		0x%08lx\n", be64_to_cpu(vpa->adjunct_insns_executed));
> +	printf("dtl_index:			0x%08lx\n", be64_to_cpu(vpa->dtl_index));
> +}
> +
> +/**
> + * Test the H_REGISTER_VPA h-call register/deregister.
> + */
> +static void register_vpa(struct vpa *vpa)
> +{
> +	uint32_t cpuid = fdt_boot_cpuid_phys(dt_fdt());
> +	int disp_count1, disp_count2;
> +	int rc;
> +
> +	rc = hcall(H_REGISTER_VPA, 1ULL << 45, cpuid, vpa);
> +	report(rc == H_SUCCESS, "VPA registered");
> +
> +	print_vpa(vpa);
> +
> +	disp_count1 = be32_to_cpu(vpa->vp_dispatch_count);
> +	report(disp_count1 % 2 == 0, "Dispatch count is even while running");
> +	msleep(100);
> +	disp_count2 = be32_to_cpu(vpa->vp_dispatch_count);
> +	report(disp_count1 != disp_count2, "Dispatch count increments over H_CEDE");
> +
> +	rc = hcall(H_REGISTER_VPA, 5ULL << 45, cpuid, vpa);
> +	report(rc == H_SUCCESS, "VPA deregistered");
> +
> +	disp_count1 = be32_to_cpu(vpa->vp_dispatch_count);
> +	report(disp_count1 % 2 == 1, "Dispatch count is odd after deregister");
> +}

Now that was a very tame amount of tests ;-)

I'd suggest to add some more:

- Check hcall(H_REGISTER_VPA, 0, ...);
- Check hcall(H_REGISTER_VPA, ..., bad-cpu-id, ...)
- Check hcall(H_REGISTER_VPA, ..., ..., unaligned-address)
- Check hcall(H_REGISTER_VPA, ..., ..., illegal-address)
- Check registration with vpa->size being too small
- Check registration where the vpa crosses the 4k boundary

What do you think?

> +int main(int argc, char **argv)
> +{
> +	struct vpa *vpa;
> +
> +	vpa = memalign(4096, sizeof(*vpa));
> +
> +	memset(vpa, 0, sizeof(*vpa));
> +
> +	vpa->size = cpu_to_be16(sizeof(*vpa));
> +
> +	report_prefix_push("vpa");

This lacks the corresponding report_prefix_pop() later.

> +	register_vpa(vpa);
> +
> +	return report_summary();
> +}

  Thomas

