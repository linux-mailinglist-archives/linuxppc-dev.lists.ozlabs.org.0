Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7BA45E3CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 01:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0bmG0KgDz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b9zU55Vs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b9zU55Vs; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0blS1gW7z2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 11:50:58 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so8779314pja.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 16:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=rfad6GS+R9gZQ+6gBqOpVoo39mJsn15reLYMXFsQgwg=;
 b=b9zU55VsP9JPztpJdKhEYok4u06qajD75Cc8h2o2hBzSwAk2de/DOLrzOZT5AHOMn3
 sKVrqZshnyIWjww2A+hC31EZ9sl1kIXm76fPrlscHscXyK2cAbady3AUntdkV8v6VsQk
 UITcXPmf4WMgEZjO1FDTl3qp6csPPk/BPvUo3FEtyGjZ46zjUYI4HPiDLe7RzcoWS08J
 4OcWTJaUt67MI9OZRAlaeNm6UV2WDXbD6Yn6Ilcs25rCMhZWqpAMuRh/901T2r19Ch+R
 JktQqdMfxA1RoBy5PLy4dZI58/bQELiMzJDBFj4f9cmGwbxAV+amBQypu3X2fT2TpfZ8
 66fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rfad6GS+R9gZQ+6gBqOpVoo39mJsn15reLYMXFsQgwg=;
 b=c6Jicp5FCZiYASvjC9QUK6Wzo3ZPBJPL+3HwPLKeR6jjNkkLIzPGRLqdFqeTIcAOTg
 tR9GlsCQBYRCKIJWyw2HStJFtWXKOwG6KmArYhpCww6rWC33Lgt+xOehaFFU+O7rjcq8
 xF9au1PwXcQgWKcDy3LVNbV/JCGbAZtaHLu0S4fUMSM8J+gJDXa3+ztJvdoQCHiJHmMC
 9R1CWliB33gug3Trf532YhNaCblKlitduhXwUdJEISt+Fef3zChQckrTIoK8RqZxGoTp
 i06K/7/UUwJWTAgdOkt0BkiRAdTIE6kmLPpuW+sce8vGyUwrNgJf7xi+7+Y+fCLC77Dj
 sP1A==
X-Gm-Message-State: AOAM531UkQPJZchYyrQ1YJpwjVKLpmg9K626JqIlLl3920mvw347HFZa
 Wsacwef1JBwnbqPZE1VtncY=
X-Google-Smtp-Source: ABdhPJwInHvsKgcit1BmxoPRiNzM/rwwnd007pmnUcZZIPx4CXUueInWdeJwH6KWgLJihd2AR/h/mw==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr11971875pjb.36.1637887853684; 
 Thu, 25 Nov 2021 16:50:53 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id f4sm4367561pfg.34.2021.11.25.16.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 16:50:52 -0800 (PST)
Date: Fri, 26 Nov 2021 10:50:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/watchdog: Fix wd_smp_last_reset_tb reporting
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211125103346.1188958-1-npiggin@gmail.com>
 <f8d08f56-29b7-5a17-9e64-5ac36731b9df@linux.ibm.com>
In-Reply-To: <f8d08f56-29b7-5a17-9e64-5ac36731b9df@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1637887834.g2b38lucev.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Dufour's message of November 26, 2021 3:21 am:
> On 25/11/2021, 11:33:46, Nicholas Piggin wrote:
>> wd_smp_last_reset_tb now gets reset by watchdog_smp_panic() as part of
>> marking CPUs stuck and removing them from the pending mask before it
>> begins any printing. This causes last reset times reported to be off.
>>=20
>> Fix this by reading it into a local variable before it gets reset.
>>=20
>> Fixes: 76521c4b0291 ("powerpc/watchdog: Avoid holding wd_smp_lock over p=
rintk and smp_send_nmi_ipi")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> This is the delta for patches 1-4 between v3 and v4 of the series which
>> is the result of fixing the bug in patch 3. Sending because v3 got
>> merged into powerpc next
>=20
> What about the 5th patch in the v4 series titled "[PATCH v4 5/5]
> powerpc/watchdog: help remote CPUs to flush NMI printk output"?

Yes it would be good to get that one in too.

Thanks,
Nick
