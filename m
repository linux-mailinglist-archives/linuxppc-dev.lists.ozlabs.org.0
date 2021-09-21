Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08055413BF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:04:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDYp66pQdz2yPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:04:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=NOWNs0gA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.120;
 helo=smtp-relay-canonical-0.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=NOWNs0gA; 
 dkim-atps=neutral
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDYnP6DXrz2yPQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:03:52 +1000 (AEST)
Received: from mussarela (unknown [179.93.212.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 36E9F4049E
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632258225;
 bh=j8GEmTQ54Fik7NmdiBXn7HI4aifxuJkNrEf5sMQwA5Q=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=NOWNs0gArwReHxyxKjCXMmHPJEA9ewFywv0sbXWSxNcHZ5yZajO0LGlKIrAZ61EZi
 YgMhA644R+b5Qem2zMwW6TboCSRa3R9k9+5SroAnh80mH2+5V9A6jAFJxbhMehgRKl
 HSLDrp3XQfMqJgBWKH0vuy4Vhe7p6lqiTBsGnaPhjw4cPt5enOSWie1aR+X85tUYHq
 GKWbPn48+lD6RTmyARIL6EoVc4q7rzwXZ8QYERjh8C7cNpyM3jLAaZm9SXAU6CBggk
 QQiJqA4J/7Hrm8/dxoZqjK+RrAIZj/bnni3DclGptwVCXZvPpVCseebCqYviiggx+P
 iOkqALkX1K0ww==
Date: Tue, 21 Sep 2021 18:03:39 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: coherency issue observed after hotplug on POWER8
Message-ID: <YUpIqytZqpohq4EM@mussarela>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi, there.

We have been investigating an issue we have observed on POWER8 POWERNV systems.
When running the kernel selftests reuseport_bpf_cpu after a CPU hotplug, we see
crashes, in different forms. [1]

I managed to get xmon on that trap, and did some debugging. [2] I tried to dump
the BPF JIT code, and it looks different when dumped from CPU#0 and CPU#0x9f
(the one that was hotplugged, offlined, then onlined).

Here is my partial analysis [3]. Basically, the BPF JIT fills a page with
invalid instructions (traps, in ppc64 case), and puts the BPF program in a
random offset of the page. In the case of the hotplugged CPU, which was the one
that compiled the program, the page had the expected contents (BPF program
started at the offset used to run the program). On the other CPU (in many
cases, CPU #0), the same memory address/page had different contents, with the
program starting at a different offset.

Is this a case of a bug in the micro-architecture or the firmware when doing
the hotplug? Can someone chime in?

Notice that we can't reproduce the same issue on a POWER9 system.

Thanks.
Cascardo.

[1] https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1927076
[2] https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1927076/comments/29
[3] https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1927076/comments/30
