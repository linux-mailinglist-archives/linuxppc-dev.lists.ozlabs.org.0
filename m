Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7633F87905B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 10:06:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv76b29NZz3vZ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 20:06:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.51; helo=mail-ej1-f51.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv7680VcFz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 20:05:50 +1100 (AEDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a44f2d894b7so654735866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 02:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710234346; x=1710839146;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PxCptN//ptR8Sr1UztZAVh/vRO6djkIgHSLUVEakk/k=;
        b=itsntHBL33Tcw3B1W1eT61T5nZhx3M3aMwITmgZrhoYHfJYZ2/c4yv6vLUseNf4vlp
         NuSOIY+BNtE+nVYZcfeq+BOEgPnQDF7/SwdffO8gmve6+H7hLRXem3PINXc5aIQWzyt2
         4JrtqMIgaVpkeXdLcvglZ7CZU3zbi+inVtCZR5sn4G6hxl0twRRDVYZsIBqJvU7DZk9T
         jnatqbQpGTzT3005rRb6vQ8ox1RTP+FXr8RQnCOFx+l2itmwUdUFcL+b4/TCB4rA2+6B
         aadAauVvxI25PUtOXdHOjEDX+naMwXniTGkSb2R31qlKfx5rFoZqTeX3ue+xlN4aX+Nw
         XHYg==
X-Gm-Message-State: AOJu0YybwzGTNzonG6eSg5cC+925Uhy8+kDeZc41pgirpwIgPL7A5Xsr
	HUVriZCPgNnWJfUpTHb/TyXuXptSrREYRt6TJllZ7lMZDwR+H3GV
X-Google-Smtp-Source: AGHT+IEUwU7t75IJNLY3HEhm/B6dGWDT+c5HRRrbusUiLgdhzbItyC5TOjncjKw03gGl01+saeugDA==
X-Received: by 2002:a17:906:3591:b0:a44:5927:3e67 with SMTP id o17-20020a170906359100b00a4459273e67mr2022454ejb.23.1710234346315;
        Tue, 12 Mar 2024 02:05:46 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-001.fbsv.net. [2a03:2880:30ff:1::face:b00c])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709064a8a00b00a45c9ea48e3sm3633728eju.193.2024.03.12.02.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 02:05:45 -0700 (PDT)
Date: Tue, 12 Mar 2024 02:05:43 -0700
From: Breno Leitao <leitao@debian.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/kernel: Fix potential spectre v1 in syscall
Message-ID: <ZfAa59Z8njiGUnRW@gmail.com>
References: <1534876926-21849-1-git-send-email-leitao@debian.org>
 <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baf6af2b-d6e1-4df8-9466-98d19f8c765f@csgroup.eu>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 08:17:42AM +0000, Christophe Leroy wrote:
> +Nathan as this is RTAS related.
> 
> Le 21/08/2018 à 20:42, Breno Leitao a écrit :
> > The rtas syscall reads a value from a user-provided structure and uses it
> > to index an array, being a possible area for a potential spectre v1 attack.
> > This is the code that exposes this problem.
> > 
> > 	args.rets = &args.args[nargs];
> > 
> > The nargs is an user provided value, and the below code is an example where
> > the 'nargs' value would be set to XX.
> > 
> > 	struct rtas_args ra;
> > 	ra.nargs = htobe32(XX);
> > 	syscall(__NR_rtas, &ra);
> 
> 
> This patch has been hanging around in patchwork since 2018 and doesn't 
> apply anymore. Is it still relevant ? If so, can you rebase et resubmit ?

This seems to be important, since nargs is a user-provided value. I can
submit it if the maintainers are willing to accept. I do not want to
spend my time if no one is willing to review it.

Thanks for revamping this one.
