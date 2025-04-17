Return-Path: <linuxppc-dev+bounces-7739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D64A91C22
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdcfz498vz3bwF;
	Thu, 17 Apr 2025 22:30:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744893019;
	cv=none; b=nohMOoxx5BpEPqfiGwdePOEVVmZO9YLznIgsjYJAdyFvPJGUnBSwULzCSJiAZVQC5FkC/yAJo9StV4VtTJpxMYUpa/txfsGzSte/6bKr98iRUQSRP4ZZy7gvk4QnVCrUYi7l/MxFmIPdLLiJ3atrRQBFEHDHeo3QsjtgjLm2foyB5j3NMwg/EjQK+UKhmdIQCC3UCWHboUluvSIeHBzSE+NQrwHDYa6dvdGe1uPUSs5YFujKRhODhHznWw+PVA1y27AS0KOBR1rIQT0HDWhLaXKC6ZYx/mZYP+rxsrigP58HsBMMgEnXvGwM9qp5U35YotDLMQNUIh7i4rK7Gfgsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744893019; c=relaxed/relaxed;
	bh=yhMyX45oy8j7OuPZBUX0GxcKvnTqCUj4i4UmRZNxPfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCTNBOKlb0eqDa3g/oLxcomFWy5AFbwpXf2HtHjJgY1Mr5wCOUHleVA/jjGmQ8nUbutw8uX5W7A+BtUlI7feMmWXNwe45lPqPs6QoJKa1kd1EoIRd4bbxBjEfO/BdZZgsiBTfOth9eRqR3e0V6ksE6jUHN1utrU1ymdWI2gle+fOtYjTLgbyl5tjNVi0WL2cLZI1+Ib7+cy4KLv+93crL13+sAZZUL5YUJXqDHttCiAqxEX2IpfsRD6nBHoANN/WdVvypfDVnLKnotwHJ3J72SYZAqmyOUJp4XYMAUyqDmMUxbXoDd+yvH/nbU6wDPALg8vEsmC56iBFDQk7f3nG0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lq6Wc3pd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lq6Wc3pd; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lq6Wc3pd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lq6Wc3pd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vmalik@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdcfy2YCTz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 22:30:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744893012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhMyX45oy8j7OuPZBUX0GxcKvnTqCUj4i4UmRZNxPfY=;
	b=Lq6Wc3pdUs+OD515yfFw2XXcUNEfBNX3V3Ea4YosJ75XQELTyK6g6APyCXr71MiGZqtUmz
	f+e/Q0EouMnBEXcD3D0bxJNcB3chQNpqbOETW0Z4f7PbrWQSfCi5fSlkONheWWrsZ2GTyO
	JvnWrmKI1gDzIUmbh7XMg8gWfAA+J9g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744893012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhMyX45oy8j7OuPZBUX0GxcKvnTqCUj4i4UmRZNxPfY=;
	b=Lq6Wc3pdUs+OD515yfFw2XXcUNEfBNX3V3Ea4YosJ75XQELTyK6g6APyCXr71MiGZqtUmz
	f+e/Q0EouMnBEXcD3D0bxJNcB3chQNpqbOETW0Z4f7PbrWQSfCi5fSlkONheWWrsZ2GTyO
	JvnWrmKI1gDzIUmbh7XMg8gWfAA+J9g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-YtXa8mXDN6OClzHB8pQz9g-1; Thu, 17 Apr 2025 08:30:10 -0400
X-MC-Unique: YtXa8mXDN6OClzHB8pQz9g-1
X-Mimecast-MFC-AGG-ID: YtXa8mXDN6OClzHB8pQz9g_1744893010
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39979ad285bso374212f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 05:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893009; x=1745497809;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhMyX45oy8j7OuPZBUX0GxcKvnTqCUj4i4UmRZNxPfY=;
        b=ldYZbUAwVv8yGuRTfXA3YlhhIF2vXXNpUC5rnbNmegQqOz0lVGV+eL4m4RVOyMKECR
         8GRZKiWK/bt2UI7Bew12udWNv/tlhU3Dk9/PgwuaHHs4F7Bq3hi6ZIeGXcaRrQRSCDRE
         4HG5B57DPhReV/oZDl3Er7B1p6qaw6zjaNkz+9d/OJqKvpkorszAruZg1nPA3h3Fgx8I
         neyQrCUKfmn7NFmT+mTRV4aKJ4ou2lyeoCgHnSgpO7HQILvbEVAA5kbWwdtYzguvI2I0
         crdsZRpfhGOqH5p0fJBk+dp1yk5p6JegNRu056NEMa3UsYCvLBzcUCBTlRqPbv3+Tm/y
         nBNw==
X-Forwarded-Encrypted: i=1; AJvYcCWM40r7t2KDn+II9X69VvpKXtht012y6JqPqsI4e19BmLF+g7h/l7dvh1qcAMaW9Y1i2l0OfDKArWCZHkg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6xsnYywYIIz9pETLeZmqRQvK4C3DirW1WQb+SG9H11i8RM0Do
	t6UwD2TkhpI9uJfaqgDt7HJzfu5zRRlcwPAVwTWIrxDX8sSa3Pnv3HD0lM5SfV+ETyMnGT68Xux
	8O4LX0RSAXCO8+8uF3pQtIOtJqyMjCIuXZcmES0WGKCZVKk/pxD4fApjFJVBV9w==
X-Gm-Gg: ASbGncvCbf8EhA6qyaKbrl8TGlsYZN4WZ4MQA1hnfQXY7X1aEWIfvkQRqToFhhT6f5l
	TZH7hKcJaswXjYcW6PZ2qPd9YNjLkevd+rR6V9CP+1Xi6M/x7J84i1HfY+zArmCD4SS8iMkwPBJ
	os5uPXCy5NVC+zD22d/E+O8tFRGU/zu02W0pqHGGajwkw6fKurHIhaqMxSY4KUH2uMGuirNfm2Y
	gr9Af2B5qsh91xtG/eIN3jLo2++1uUZny06cdTVDNMSDkOMGQWmT3pU7drJRvs0EEm4TGKGNZ40
	pMDJWeV0mrx2K6CE18guPC5Jm6P6jYs=
X-Received: by 2002:a5d:64ae:0:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-39ee5b10eb7mr5582949f8f.2.1744893009624;
        Thu, 17 Apr 2025 05:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM+EJsa6GxQG1p+PKq+EFBpaq5Cqq9HZNJaYx3ETePAwU12QpiixwVwkoc85pVDuylnTVdww==
X-Received: by 2002:a5d:64ae:0:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-39ee5b10eb7mr5582912f8f.2.1744893009131;
        Thu, 17 Apr 2025 05:30:09 -0700 (PDT)
Received: from [172.20.10.3] (37-48-9-64.nat.epc.tmcz.cz. [37.48.9.64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce3bsm20457233f8f.66.2025.04.17.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:30:08 -0700 (PDT)
Message-ID: <0a3e442f-339a-44ad-aad8-c21ec342c5a8@redhat.com>
Date: Thu, 17 Apr 2025 14:30:06 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc64/ftrace: fix clobbered r15 during livepatching
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: linux-trace-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, stable@vger.kernel.org
References: <20250416191227.201146-1-hbathini@linux.ibm.com>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <20250416191227.201146-1-hbathini@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ujHZvFm3kN50PyHb-5IwRB0Hpbu_ygjzNedgTTLoCw8_1744893010
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/16/25 21:12, Hari Bathini wrote:
> While r15 is clobbered always with PPC_FTRACE_OUT_OF_LINE, it is
> not restored in livepatch sequence leading to not so obvious fails
> like below:
> 
>   BUG: Unable to handle kernel data access on write at 0xc0000000000f9078
>   Faulting instruction address: 0xc0000000018ff958
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   ...
>   NIP:  c0000000018ff958 LR: c0000000018ff930 CTR: c0000000009c0790
>   REGS: c00000005f2e7790 TRAP: 0300   Tainted: G              K      (6.14.0+)
>   MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2822880b  XER: 20040000
>   CFAR: c0000000008addc0 DAR: c0000000000f9078 DSISR: 0a000000 IRQMASK: 1
>   GPR00: c0000000018f2584 c00000005f2e7a30 c00000000280a900 c000000017ffa488
>   GPR04: 0000000000000008 0000000000000000 c0000000018f24fc 000000000000000d
>   GPR08: fffffffffffe0000 000000000000000d 0000000000000000 0000000000008000
>   GPR12: c0000000009c0790 c000000017ffa480 c00000005f2e7c78 c0000000000f9070
>   GPR16: c00000005f2e7c90 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 c00000005f3efa80 c00000005f2e7c60 c00000005f2e7c88
>   GPR24: c00000005f2e7c60 0000000000000001 c0000000000f9078 0000000000000000
>   GPR28: 00007fff97960000 c000000017ffa480 0000000000000000 c0000000000f9078
>   ...
>   Call Trace:
>     check_heap_object+0x34/0x390 (unreliable)
>   __mutex_unlock_slowpath.isra.0+0xe4/0x230
>   seq_read_iter+0x430/0xa90
>   proc_reg_read_iter+0xa4/0x200
>   vfs_read+0x41c/0x510
>   ksys_read+0xa4/0x190
>   system_call_exception+0x1d0/0x440
>   system_call_vectored_common+0x15c/0x2ec
> 
> Fix it by restoring r15 always.
> 
> Fixes: eec37961a56a ("powerpc64/ftrace: Move ftrace sequence out of line")
> Reported-by: Viktor Malik <vmalik@redhat.com>
> Closes: https://lore.kernel.org/lkml/1aec4a9a-a30b-43fd-b303-7a351caeccb7@redhat.com
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>

After applying the patch, the panic doesn't happen anymore and livepatch
works as expected.

Thanks!

Tested-by: Viktor Malik <vmalik@redhat.com>

> ---
>  arch/powerpc/kernel/trace/ftrace_entry.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
> index 2c1b24100eca..3565c67fc638 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -212,10 +212,10 @@
>  	bne-	1f
>  
>  	mr	r3, r15
> +1:	mtlr	r3
>  	.if \allregs == 0
>  	REST_GPR(15, r1)
>  	.endif
> -1:	mtlr	r3
>  #endif
>  
>  	/* Restore gprs */


