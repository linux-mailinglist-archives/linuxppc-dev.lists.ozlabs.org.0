Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A113E8FC10A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 02:58:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FG8lQFOO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8G05cs3z3dTf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 10:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FG8lQFOO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::32; helo=mail-oa1-x32.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv8Dg0h4Hz3dHR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 10:56:50 +1000 (AEST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-25071c66178so865601fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 17:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717549005; x=1718153805; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxiHTvW4fLj218sfZgJiWyyM2cX+ZQCrleLdQL7F14o=;
        b=FG8lQFOOQm7uaA8DGTolAOqYjddzAkgzfhsw/HD4ahp1XG7P/X9oysQ35vAM8KO7dU
         ptD8J4E+BzLnbXQB3XdItp8bCppkAyRt6/6TJ85zKJUXsODORSDXDHgUvXg9GgctgNB0
         0fVdoZsJek1FJVnO5dPCZ+rOM7+r4/R+ONHzH6KnbOlePwsd+G4zYi5KZLt47mk97HIp
         av1Bo8LKG/QX12Ur8w88A+tg2ftVV0YeqI9+J17EgmXQpM3SaiF4AVl2nyHmjUdF0l7s
         hzzvg4PCgJ3Ipyh5IbJyFZpsC8+3p2NwBI07KTa7HI0JFufoeFpKqZVIlvt2g651EWaD
         PJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717549005; x=1718153805;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxiHTvW4fLj218sfZgJiWyyM2cX+ZQCrleLdQL7F14o=;
        b=XEZeleqtyQ5gmuhuswQGpv+i1dK4KVx8zmy4kLmcrOtKpCNT1Bd97HlyQrQAT7b7iN
         9VBI1NAiELR3X/kKvyJHsVs1ecyrTIyT6TFL2NnsqYmlrLjVy3TOJpnz7NIWzPrlN9t+
         BBawkCMIffPOVNT9j5H1Q6MU2sGe1RO0T/rC1lRcnyfLEnvfQyIS2YVgQ+7bDe5qPUch
         teUs2RsFLy25p5t2i52wESBeIzcRpS0Q1gsv2BiITeA9JWhCZEsr29IkB+vTHIqjoyXu
         fAQ6JoqaocDiC8cdI4bYdKsf/sx3gyBTbRo3VxbDg1rDTo8yA61p+fJ5T9IHd3uWM1br
         rPhw==
X-Forwarded-Encrypted: i=1; AJvYcCVdmwrIR3ac7kD1gi7VOtApmpa3HT5HPv0ivZ94swqFpzThliIRYk5mCnwvXCijY0RkQU3hcQuNYDuYbtgzGab96TU1hdo5zKkqYRxvBA==
X-Gm-Message-State: AOJu0YySDuFFATpzLN/Z6mHcBlZFUU54eiJF5cte6PwAWGfonwOi8I0v
	M44HbFXucXXhBHSUIr0ViFM2fOB5OoNzHQ2MzzW9M4M7yMvA91Hi
X-Google-Smtp-Source: AGHT+IHZf0KMvKkEQxVk0jcPkbXTYisvbN1p0JsOySwpkK3+k5sAwhsFJ8dCrfGyMELfpVfU0S+dzg==
X-Received: by 2002:a05:6871:7993:b0:250:58b8:bbe2 with SMTP id 586e51a60fabf-25121d1ef8fmr1386345fac.4.1717549005250;
        Tue, 04 Jun 2024 17:56:45 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b048desm7873342b3a.143.2024.06.04.17.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 17:56:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 10:56:40 +1000
Message-Id: <D1ROB25JV89B.25ADSPGY2NS9E@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 20/31] powerpc: Add atomics tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-21-npiggin@gmail.com>
 <f559f65b-a0ac-4810-bc5e-11edf46b693f@redhat.com>
In-Reply-To: <f559f65b-a0ac-4810-bc5e-11edf46b693f@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 3:29 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
>
> Please provide at least a short patch description about what is being tes=
ted=20
> here!

Will do.

Thanks,
Nick
