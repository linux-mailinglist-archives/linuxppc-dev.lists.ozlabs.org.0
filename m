Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6B7852862
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:54:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fc7Tm48I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYrBc5hmDz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 16:54:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fc7Tm48I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYr9q2zQSz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 16:54:06 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3c03d6e5e56so1213222b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 21:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707803643; x=1708408443; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMQUojdk15RbrdNC7NJ0tyeyVEBYs/vQL/GXUKmgxZk=;
        b=fc7Tm48Iy0rmMaZ+ziZI0RfU9X+pnK9wUJm+WNYgUTiLMAMY5X/CqeZHstFboCfp94
         6s/kkQvbLkxCiokM5oCvfgxTj5FF2TuYuCREpu2NtOSYRkUoz3sZUosZ3lXfIl3N4Ste
         /oVz5efnKm46zJLWia9DssRgOBdudBl7hoE7tKvevBSki/38o0loFLBOjwJNk9uPRAHF
         lhe7Zsh7DKDt/aAlAhNukQWB6qv2qM+oBA50azLTmdcd+8Z5JQLQXyF5wxIdXKS61O1q
         qZ+Mk018sunFpxUgjU0vX2TUbhVKFs6zneYOeI6bOXWMvzZvcqGRCRr5c8VCS34HjMXq
         Miwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707803643; x=1708408443;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMQUojdk15RbrdNC7NJ0tyeyVEBYs/vQL/GXUKmgxZk=;
        b=CSL8jXDO3N8fkrrhNIvUq3zjMzVJhqt3sG+rsz1H5DdMQwEhjwm4VBtDb22grnjX+k
         D0Fms3d5GLmw8KtlGqip4jJJK/Bw2BAxNYJtXKzAFdOIeS+IqVexLFsbZ3iR/t05EfZ2
         l0UTNxxrNmV+AY5W87ghOYagJu/8u4kWIzO5fH00Wfs0AUNqdLJCK2uKkJxgHsz6KA0n
         dR+hoAVJ3tha+vOxxigDyYTvcYc1tBZfdId0cb7wz62mqBaG2FMOu4U1bB2A7LNJqKWd
         h85PljNukE++sKTsI8atWgCZy7NTJZT38tsiFmufjFjtwCIkGHz8WMd03dVtgoBD3aJL
         gA5g==
X-Forwarded-Encrypted: i=1; AJvYcCW8oaDl69N9poGY8+GbaVmTvrM7IAOcDCvXs7A5J82O4S/0/Rs34Db1md8Ot7iGWDo0iJSIV583EV0AGs9KOfUGbW5DGAwVjcHLtnFh5A==
X-Gm-Message-State: AOJu0YztKNtlzUPZ5iPoLrXmOzfNEZwzmabelIP94N6YONswYiBpcW3X
	mHpLZBzUZUmfKV+ZRmxLGZVy8I8nDCWQRfne+HffRbrJYbVazqxW
X-Google-Smtp-Source: AGHT+IEUWuORmjCgJ+4i7IIh/xBBll05AG9BqZSvmNU+CE+qZuR3wRuetV1/koUYjORwzJ5bYC8wvA==
X-Received: by 2002:a05:6808:168d:b0:3c0:3761:c8ab with SMTP id bb13-20020a056808168d00b003c03761c8abmr6354922oib.31.1707803642767;
        Mon, 12 Feb 2024 21:54:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa6HjUlNAoz+oIRsUvY4XKOHW8SmTq66vn7a/avcJSOLJ6V82KK2LGBuw1Cr3MvjqfXdhq+BpBnI4cLGpl7VoxHFdVy5e9FuuUBEjpjm6kvt3Xvc2OIMOfMKfRpm0DCEG/EvNGqUoCfWgn8n0Vn2SNtCRqTBiFRo/bBsSZLbhTxfW1oYtLnHdxcuM2Gp1hx94/JQqwVPKb61WW5I+sujQHAzldQD/FoAPkfP8CmmuFTFI=
Received: from localhost (193-116-232-205.tpgi.com.au. [193.116.232.205])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7820d000000b006e03c7e74fesm6511486pfi.126.2024.02.12.21.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 21:54:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Feb 2024 15:53:55 +1000
Message-Id: <CZ3PV3B25X28.11IO3Q978SM4P@wheely>
To: "Shrikanth Hegde" <sshegde@linux.ibm.com>, <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: fix accuracy of stolen time
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20240213052635.231597-1-sshegde@linux.ibm.com>
In-Reply-To: <20240213052635.231597-1-sshegde@linux.ibm.com>
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
Cc: aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Feb 13, 2024 at 3:26 PM AEST, Shrikanth Hegde wrote:
> powerVM hypervisor updates the VPA fields with stolen time data.
> It currently reports enqueue_dispatch_tb and ready_enqueue_tb for
> this purpose. In linux these two fields are used to report the stolen tim=
e.
>
> The VPA fields are updated at the TB frequency. On powerPC its mostly
> set at 512Mhz. Hence this needs a conversion to ns when reporting it
> back as rest of the kernel timings are in ns. This conversion is already
> handled in tb_to_ns function. So use that function to report accurate
> stolen time.
>
> Observed this issue and used an Capped Shared Processor LPAR(SPLPAR) to
> simplify the experiments. In all these cases, 100% VP Load is run using
> stress-ng workload. Values of stolen time is in percentages as reported
> by mpstat. With the patch values are close to expected.
>
> 		6.8.rc1		+Patch
> 12EC/12VP	   0.0		   0.0
> 12EC/24VP	  25.7		  50.2
> 12EC/36VP	  37.3		  69.2
> 12EC/48VP	  38.5		  78.3
>
>
> Fixes: 0e8a63132800 ("powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACC=
OUNTING")

Good find and fix. Paper bag for me.

I wonder why we didn't catch it in the first place. Maybe we
didn't understand the hypervisor's sharing algorithm and what
we expected it to report.

In any case this is right. The KVM implementation of the counters is
in TB, so that's fine.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/lpar.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfor=
ms/pseries/lpar.c
> index 4561667832ed..bdcc428e1c2b 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -662,8 +662,12 @@ u64 pseries_paravirt_steal_clock(int cpu)
>  {
>  	struct lppaca *lppaca =3D &lppaca_of(cpu);
>
> -	return be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb)) +
> -		be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
> +	/*
> +	 * VPA steal time counters are reported at TB frequency. Hence do a
> +	 * conversion to ns before returning
> +	 */
> +	return tb_to_ns(be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb)) +
> +			 be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb)));
>  }
>  #endif
>
> --
> 2.39.3

