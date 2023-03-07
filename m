Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417226AD6EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:41:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW47x18F3z3f3w
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:41:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h5OMMYCz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h5OMMYCz;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW4726qs2z3c6f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 16:41:01 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id u5so12931522plq.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 21:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678167659;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGv6GHE27MGSVflQtDHPfQYBafwMHw6AkZ/7Wt1ZWkE=;
        b=h5OMMYCzFXuGXQtnbN+6XKj3cOqI6u2244jsCBx9DvFfWe1prwRzjjrcW8h5mZUVsl
         QmtkU7oAEqBmOVOf3By0/ENqG1da+qEjKw8kw4fgSFHoLvJVa6DQugYcc9U1yI7SWEei
         dMGMlInHwzV4GzSN4SL1CfwaI/eEAMNxQDJc1IpuhmCs5Utn8Msj9OaxrYrV8cOsSDBu
         mFPn77jHctXK2An5AlqFoAmLNBFbtLbfDQ6by1EiYLIHXqj2e6SaNEoN+KTAXlLI2K+J
         PpXm8GsCqN4MGUjTEHSTiSJ1nvf4ZuYjpl7O+me1lna4SRlB1kKl3UKnrGkxrhUzS9wa
         fpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678167659;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vGv6GHE27MGSVflQtDHPfQYBafwMHw6AkZ/7Wt1ZWkE=;
        b=XCA4V2VNF8r4Mz/kd5aSqnbsS/lA1w8diErd+QbrgTpVUb6jt5bOsWLW6xSrLOMwK+
         YpbNt0wfWcI5w92N2qD4tR+htDJE0Qn9leRzVFelj6Io+A0jEGr2+rN+hZUxViR8p5Ih
         kDXeWF6A1XyXaPuUSSLbOtg3A2SLQw5FAk6hMZBmcZb/FWfPyF7QIA22F3jSc7wWEgEH
         UuPLuMYgWR3k0e8myut0Mp22p7CaL4lWH8BaMF/mu0Xe9uLSlEIrPqC+LSkaEbAaR/Ap
         W/WKewNYzK9T07o/fgBYDYdR1RZbVBOkm6383dLL+73FVlOjQ7pAcWYoYdkKFM+QmKxC
         Kwcg==
X-Gm-Message-State: AO0yUKUfQnWy9svIgYL6CunKn1ZIYwxrTfVklI3bpFjGp9ay3FwaL7Ue
	tGpstA2k3Zy3utRz3wAH2uo=
X-Google-Smtp-Source: AK7set8VC3fm3ZkdCGJzVjZzCmrjLdp7cGedega8vr5ALkoyI34URjaCfZ8FcGpRnpm9rseLgW0qhQ==
X-Received: by 2002:a17:902:d381:b0:19c:d537:754 with SMTP id e1-20020a170902d38100b0019cd5370754mr12496238pld.56.1678167659064;
        Mon, 06 Mar 2023 21:40:59 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902cf4700b0019adfb96084sm7615183plg.36.2023.03.06.21.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 21:40:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Mar 2023 15:40:53 +1000
Message-Id: <CQZWS8VFIL3Q.G9POORQXDKE0@bobo>
Subject: Re: [RFC PATCH 13/13] Documentation: Document PowerPC kernel DEXCR
 interface
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-14-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-14-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> Describe the DEXCR and document how to interact with it via the
> prctl and sysctl interfaces.

Oh you've got the docs here, sorry. Thanks for that. I don't know enough
yet to give much useful feedback on the API. I think at least all the
mechanism stuff up to the prctl API looks pretty straightfoward so would
like to get that merged if we can.

Might need a bit more time and discussion on the API. Interestingly
because the hashchk aspect is architectural, we may not be able to
necessarily sanely enable that, because if it was disabled to start
out with, our callchain up to the prctl call I think would have no
return hashes set so we'd immediately fail on our first return.

Thanks,
Nick

