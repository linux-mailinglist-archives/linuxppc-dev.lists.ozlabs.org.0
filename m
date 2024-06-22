Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39499132C5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 10:29:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GjXkBGLh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5nSb4RDCz3dCy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 18:29:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GjXkBGLh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5nRv0PTnz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 18:28:26 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7024d571d8eso2201277b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 01:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719044904; x=1719649704; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lz13g7WWD7SCXLXdsV9OiBB9IU7Ale7fsh+I+PUi4w0=;
        b=GjXkBGLhN6n+AqbRJQOrLOyjEoi35cG3qDvo5DaSrLu5X++UrBLFrQ/0p+rz3F0dEf
         d65IFx/Niu2saiW3HjpqHmRN6bfCjYBkRvFnW7wd1Gws/SY1KTIuNMNdbp3kext3P7fr
         MqqxKVKtHwTO5KP2cFoM8tXwd5tjoV9XTdQhJwbzpL4c41hZ1OO89lnCCisACCIaj7Op
         KBmIC188OuO/wMB5BUrAqy705raU/iyY/5hxUlZAoOljLMDIKMnn40p1bHUsrcr5BPQL
         DsIyqQah0DM3Iw+zq2EJz3k0AvKXpxobd1Ss0DMI2j6/0KctihvZhp48CypyvxqRPNzh
         jMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719044904; x=1719649704;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz13g7WWD7SCXLXdsV9OiBB9IU7Ale7fsh+I+PUi4w0=;
        b=tQKyLVjxjqy/69ra88wnK/vZecWYa4C7tAfjC4baM5nSjFjagkx9RYG0+x9d/PFGJq
         EAkldDhdPuba4AbRneuMB3L1fPB0g2XiGDQdTWYXv9feyVzawzluWXPNkaFyHg4cJb0s
         SkN3fMdzxYMhdyeeQ7WoiYV+Hs3kuos1XFEZbvKfendifK9cjefeTTOciBElDUJQ9m+U
         y7vlqOuyVodR9jbGwauD0/xMZMrhtReJiqoYsI6DYLCDayH5oUxfhJpATIV+YfeNGvGa
         jF8UPUPttFKOgZFewuToi/GSwfvhNZ4qX+gKcVXorxdl2CzFgF4AEqeRXMhLBPDFJIju
         HnSg==
X-Forwarded-Encrypted: i=1; AJvYcCUSvE5uu9d0fIpIFg/tkgB5B/oQ5lNVDdf2VFZCym5HMMalTZMwqEmnSQFAXyzG4qxIYUk6dV9dnF3j2o/ZGIXBLy7BuTrfwcYMnwiEUQ==
X-Gm-Message-State: AOJu0YzMbu2G8TQkQHyld2AZTMKpLYxuyGbWXy3SV82LC61IzXTWGRHk
	jO80V7bevphsGFOfeiyhupnqf+WDFFnGp3iE6+OCWqC3KXoQmyJ3JU8lbQ==
X-Google-Smtp-Source: AGHT+IFcnx61uy7g0kw3aLJ77/PGVvX0L+zWvhPU+VagXYhUMzhh6AWDD11G+7juX976CEZMCnFWYg==
X-Received: by 2002:a05:6a00:4f5a:b0:706:6af8:e08a with SMTP id d2e1a72fcca58-7066af8e59dmr618589b3a.2.1719044903849;
        Sat, 22 Jun 2024 01:28:23 -0700 (PDT)
Received: from dw-tp ([171.76.84.215])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065124e3f9sm2593727b3a.123.2024.06.22.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 01:28:23 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH 3/3] powerpc: Document details on H_HTM hcall
In-Reply-To: <20240620174614.53751-3-maddy@linux.ibm.com>
Date: Sat, 22 Jun 2024 13:57:20 +0530
Message-ID: <87le2x5qmv.fsf@gmail.com>
References: <20240620174614.53751-1-maddy@linux.ibm.com> <20240620174614.53751-3-maddy@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, Madhavan Srinivasan <maddy@linux.ibm.com>, christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> Add documentation to 'papr_hcalls.rst' describing the
> input, output and return values of the H_HTM hcall as
> per the internal specification.
>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  Documentation/arch/powerpc/papr_hcalls.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
> index 80d2c0aadab5..805e1cb9bab9 100644
> --- a/Documentation/arch/powerpc/papr_hcalls.rst
> +++ b/Documentation/arch/powerpc/papr_hcalls.rst
> @@ -289,6 +289,17 @@ to be issued multiple times in order to be completely serviced. The
>  subsequent hcalls to the hypervisor until the hcall is completely serviced
>  at which point H_SUCCESS or other error is returned by the hypervisor.
>  
> +**H_HTM**
> +
> +| Input: flags, target, operation (op), op-param1, op-param2, op-param3
> +| Out: *dumphtmbufferdata*
> +| Return Value: *H_Success,H_Busy,H_LongBusyOrder,H_Partial,H_Parameter,
> +		 H_P2,H_P3,H_P4,H_P5,H_P6,H_State,H_Not_Available,H_Authority*
> +
> +H_HTM supports setup, configuration, control and dumping of Hardware Trace
> +Macro (HTM) function and its data. HTM buffer stores tracing data for functions
> +like core instruction, core LLAT and nest.
> +

Minor nit: Maybe the set of debugfs cmds to collect the trace and some
example trace log? If it is not confidential?

>  References
>  ==========
>  .. [1] "Power Architecture Platform Reference"
> -- 
> 2.45.2
