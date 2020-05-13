Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB231D0734
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 08:27:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MPqQ3Tt9zDqc8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 16:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=GLjuEFNs; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MPlg6rG5zDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:24:31 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id o19so1745325qtr.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=ha/ounVPt6yY52Fm9rK6clkqfuhFQ2zd+ThkBQKemO4=;
 b=GLjuEFNsKrWt/eI0OIGIaj3JW23vEO6bqvgqwo2GFK/n+aEeWEAu86Hy+UzeD5t3xf
 G5jmATRNs1B79Y5CQo28cjOqzkn8Ark9FBUzQ+FBDKxL7JbGM57994g1ywYfgR0kS9F7
 ExQVOCPdnHWHrKhOQ5eJCPgNkpbadOmRSmyBvLQQYmfet/hNo9ZzL4yBs4HabnDaP8pa
 X3Wr4CFmML7GGpCr2C8jGf9Bu6hrkr4vTlUMnh7UrT1QoqmwUrYUBBrlGBGrR1qMU7uE
 hX0Slm0avY/QUfP4I838fUNVblnxc5ehhfMAKJYLpm42+ILRgPVPqhSsrwXOwvfi6fDq
 816g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=ha/ounVPt6yY52Fm9rK6clkqfuhFQ2zd+ThkBQKemO4=;
 b=iCgP6y7g3fq0p+CMBVtFft3V8Ux5U0epezsMQfG0TIizzbegV78V2DN5JjpO9PywEo
 9tUCtyD1hoQBQH6ZQ5c7DIUI49+2g2HG1cqdqfi8avzx+hIrviXekWT7zQto3t8yvl+s
 9+HpKjZz4ZnEWiO+lP1RUxgxItiKSBgNqYJD1TfWMS5kDLFxZDOrM+wPhoRKiUYp2IQ7
 j+4VnVhHQZ2P4SNT2M9S6UMCjHeFt7ZlvkXEj/W3t4OiALjGokZEzm0YuQmqxZ4IR4E1
 82xLNjGh9CdYNz9YxMv2i5kL/N06AmbFT7juJIAK9PAxocafxHXyxu7yvBEuZyuwtOC/
 +Yng==
X-Gm-Message-State: AOAM532NvHmGrqPUG63iWCC1uSXNtPxdq4bL9nru0idtYLmWUzrD1MRN
 LNb5lYqIH8QWI6YZIQT6lOYsoQ==
X-Google-Smtp-Source: ABdhPJxTYQm31Sf4DquSKEbLUABTbJHGdWBrkj7N/gWc05wPWn2ctXxedJf2IrAYckiob4si+X2FBQ==
X-Received: by 2002:ac8:724b:: with SMTP id l11mr6049058qtp.27.1589351069158; 
 Tue, 12 May 2020 23:24:29 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id t12sm12580679qkt.77.2020.05.12.23.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2020 23:24:28 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] powerpc/kvm: silence kmemleak false positives
Date: Wed, 13 May 2020 02:24:27 -0400
Message-Id: <F9DDFD57-C008-4518-B54C-91814286E2E8@lca.pw>
References: <87h7wkbhu4.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7wkbhu4.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (17D50)
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 catalin.marinas@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On May 13, 2020, at 12:04 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:=

>=20
> This should probably also have an include of <linux/kmemleak.h> ?

No, asm/book3s/64/pgalloc.h has already had it and since this is book3s_64_m=
mu_radix.c, it will include it eventually from,

asm/pgalloc.h
  asm/book3s/pgalloc.h=
