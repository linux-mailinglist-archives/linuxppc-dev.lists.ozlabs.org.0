Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A3731D4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 18:03:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f3q81OD5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhnBs0Nt9z3c1R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 02:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f3q81OD5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhn9x4p7qz2xbC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 02:02:28 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-311183ef595so601006f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686844941; x=1689436941;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuwWGq/HZTxd+1ns842IDWBOssilEnZa9jIQGRloFJA=;
        b=f3q81OD5ezF4qhYMYUbnN+WtLhIvVBfMYV4g1xtJKhjK7wFmV5gErSXzTP1kZ6LBG5
         60ghM80tKdOR7U3UAP5VnGZSurLa+9hP1j9otZXiyL26B6cwyTDoxIhxdi9svkB3zLhk
         esXYJlm5FDk+2iiQY7csUZcjPJXM6uQG9V0ooaVGBejvlB9DSyKK+3+JvHItNmChoS17
         pixbcCgLEDzf3i6Q+dyVGxsLaf8/Qg/0LXxMWlskC4BAQzxxT66stQ9zr8SNfBR0QRn1
         pYJ2+8NGv7p4tMZWMcDyCPV7iC2tc5XMix76b+LpytznRXLHnjkSXEAA5UKBVcZ3QG/i
         iQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844941; x=1689436941;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SuwWGq/HZTxd+1ns842IDWBOssilEnZa9jIQGRloFJA=;
        b=foES4eV60u/5cB0lA3VoTyUw6vfj7GQdOFLMATLtDI0QQbX5kYwvLWGFKXIMSXhbmJ
         NZvYDmK+a8Eki6ZNpcJyMTLsRX4Nut/79ZfWPuI0sCYLLFum8QmqGY9jVY5NKw5az9DM
         HwNYg+qhmRQU+E7Zjp7A4xHg9a/uTjlL2j8wxX4Mf0jK+IE6GO1956No7z0aUn+eJOiz
         gh6th7pIPo/OFfYpxzk1annRUZ0cxUGetZCnxCwqC6uo7ZFpX1DKafJnRgg9XGzgZWb4
         ajByXrDN3U3fk0Gfa9oGp/vfvYbc7e1wGdBvvF6FaDGF1pqIIiXEyMm7xiL75Ages6b+
         olgQ==
X-Gm-Message-State: AC+VfDyc6RJAIQgAGUp7T/A/XKaYduAZXXNF1iu3jYtujwDz0aPVxIB/
	MIrAC2y1kmeeDEADuXuqQ04=
X-Google-Smtp-Source: ACHHUZ5MqPAJT3yys/PhcsaiSphe9kaP3XoGrFoelWEJzR7ufELNuAC+SxXIe55D9uq6SoyF4MjE5A==
X-Received: by 2002:adf:ff87:0:b0:311:1b27:74a6 with SMTP id j7-20020adfff87000000b003111b2774a6mr569553wrr.28.1686844940673;
        Thu, 15 Jun 2023 09:02:20 -0700 (PDT)
Received: from [192.168.0.210] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id f9-20020a5d6649000000b0030f9dc63ff1sm19454197wrw.88.2023.06.15.09.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 09:02:20 -0700 (PDT)
Message-ID: <7a853516-9da5-811b-1e9c-84e5483a8a08@gmail.com>
Date: Thu, 15 Jun 2023 17:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Shuah Khan <shuah@kernel.org>, Nicholas Miehlbradt <nicholas@linux.ibm.com>,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>,
 Benjamin Gray <bgray@linux.ibm.com>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: file removal issue in tools/testing/selftests/powerpc/mm/tlbie_test.c
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Static analysis with cppcheck has found an issue in the following commit:

commit 047e6575aec71d75b765c22111820c4776cd1c43
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Tue Sep 24 09:22:53 2019 +0530

     powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on POWER9


The issue in tools/testing/selftests/powerpc/mm/tlbie_test.c in 
end_verification_log() is as follows:

static inline void end_verification_log(unsigned int tid, unsigned 
nr_anamolies)
{
         FILE *f = fp[tid];
         char logfile[30];
         char path[LOGDIR_NAME_SIZE + 30];
         char separator[] = "/";

         fclose(f);

         if (nr_anamolies == 0) {
                 remove(path);
                 return;
         }
	.... etc


in the case where nr_anamolies is zero the remove(path) call is using an 
uninitialized path, this potentially could contain uninitialized garbage 
on the stack (and if one is unlucky enough it may be a valid filename 
that one does not want to be removed).

Not sure what the original intention was, but this code looks incorrect 
to me.

Colin
