Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 074AF97A45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 15:05:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D7DY1CnXzDr5s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 23:05:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=netronome.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=jiong.wang@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="eN2sJxBY"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D1wq26LLzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 19:05:59 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id r3so1278129wrt.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 02:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=fQeTw8XVpz3MXJ+9QKUltKbufjCfYbnuGVJHHdsUDLI=;
 b=eN2sJxBYytWmV3/n076E7pwNxHyBqPih6k1yaMTSgWesLfORTfAQd/TyGk2BSf6eDw
 OTh9CSsPjuOfOv+ZYebNkiivlWNXMt3AWrscTv4UmcqfK3bvUEiI9sjHdDpJ5U1JrXtG
 PVfMJKDMCk7WSQ0dnvEFFQiJS+Rwz3XRCMLCflYtp7yecqs+fBoJ9udb+dMYH7Ka9+VE
 iaBGNJmfnZSOqQVqUEKnIQjlYppxz9AotT+CDtLRDn5JYGqQy9GibuJ8n/zwK3KZoy+1
 yFN/6kJyjNUE/X4QgWakwmg3FJEgjx8TyiP/2HLaWHDxdIRt39KUcrClx9ExN44FOYAj
 sQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=fQeTw8XVpz3MXJ+9QKUltKbufjCfYbnuGVJHHdsUDLI=;
 b=g+GgCHd/aKaGjH4+ElzWlAkCuP6j1dDKt5FcOahcRfeAwpOhvI2rNFAsaTQ7bH9JIF
 EHtN3BwzVY8of73E/+ripwIaqMqn/rUlr9m/hXCBPkAIgzxSTAFpFVy5YAeLvqwYLWJj
 WzTSLGscsN6DPHxWj1263L/LLKZrSy6RQNFej3XgOnBm9DfOB9p7oaXri/R6b+gF8aZ+
 oDAD/Dd2kNHjZ7M1UPwf7caWVRzWvvysyFzliOvEiEMYTY3G6QtVf2tbrTGTgjgwSk0t
 8PasLSVcSemINsI6f/OxmxxMCAki6qfRWcK6QFurjLkU2IQbM53L7I9pyG7kqEIpdJTL
 S95w==
X-Gm-Message-State: APjAAAXKFoiAQ+o390awcyOUdgSiN4OWZxJ3PMpZXrclcw1Q4LKSBKRj
 GXscgIvlq2LoSahNDtxUkdwyZw==
X-Google-Smtp-Source: APXvYqyjvAvT4fg2ukxmE0qZ9tQtEBd7iI0jte/BSRbLASZkZ+xMjQBSSJvfCpxW0Oo/+1F7zkzQbQ==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr14236353wro.284.1566378355151; 
 Wed, 21 Aug 2019 02:05:55 -0700 (PDT)
Received: from LAPTOP-V3S7NLPL ([217.38.71.146])
 by smtp.gmail.com with ESMTPSA id 91sm64065796wrp.3.2019.08.21.02.05.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 02:05:54 -0700 (PDT)
References: <20190813171018.28221-1-naveen.n.rao@linux.vnet.ibm.com>
 <1566376025.68ldwx3wc7.naveen@linux.ibm.com>
User-agent: mu4e 0.9.18; emacs 25.2.2
From: Jiong Wang <jiong.wang@netronome.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH] bpf: handle 32-bit zext during constant blinding
In-reply-to: <1566376025.68ldwx3wc7.naveen@linux.ibm.com>
Date: Wed, 21 Aug 2019 10:05:53 +0100
Message-ID: <87y2zmubv2.fsf@netronome.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 21 Aug 2019 23:03:03 +1000
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Jiong Wang <jiong.wang@netronome.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Naveen N. Rao writes:

> Naveen N. Rao wrote:
>> Since BPF constant blinding is performed after the verifier pass, there
>> are certain ALU32 instructions inserted which don't have a corresponding
>> zext instruction inserted after. This is causing a kernel oops on
>> powerpc and can be reproduced by running 'test_cgroup_storage' with
>> bpf_jit_harden=2.
>> 
>> Fix this by emitting BPF_ZEXT during constant blinding if
>> prog->aux->verifier_zext is set.
>> 
>> Fixes: a4b1d3c1ddf6cb ("bpf: verifier: insert zero extension according to analysis result")
>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>> This approach (the location where zext is being introduced below, in 
>> particular) works for powerpc, but I am not entirely sure if this is 
>> sufficient for other architectures as well. This is broken on v5.3-rc4.
>
> Alexie, Daniel, Jiong,
> Any feedback on this?

The fix on BPF_LD | BPF_IMM | BPF_DW looks correct to me, but the two other
places looks to me is unnecessary, as those destinations are exposed to
external and if they are used as 64-bit then there will be zext inserted
for them.

Have you verified removing those two fixes will still cause the bug?

Regards,
Jiong

>
> - Naveen

