Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C4C44D08C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 04:56:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqSZv1Xtbz2ypX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 14:56:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Yves5vPe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=efault@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Yves5vPe; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqSZC3Cryz2yL9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 14:56:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636602934;
 bh=dQamGkACivMnZRQUR0T76ZNCpqCZTQRKjl1oGTBkQl8=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Yves5vPe/SSFfHtPUADj0VB94SOMy+Zbo9BW9i0rMDRhU4a3IKmVsbXjZsGRD85I3
 gJj8zpq1uFPc1rATTH8J1TPUMKGlCcO9NP+DzBGeVDhCxdSsCgAurU1xj5zx34n4l2
 Xq+ie3YoounjpMWE4L+AkvetI2TekH7IfLvQ1LqA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUjC-1mTu4a2aTy-00rXfd; Thu, 11
 Nov 2021 04:55:34 +0100
Message-ID: <952135b1fcfdabe40c2cfaf2ef0a5b90ede418fe.camel@gmx.de>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
From: Mike Galbraith <efault@gmx.de>
To: Valentin Schneider <valentin.schneider@arm.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Date: Thu, 11 Nov 2021 04:55:30 +0100
In-Reply-To: <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
 <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
 <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
 <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qqcgSnijT7Gw/VNX30SqkB8YdoGSCJKiue2bRmosehBHInhIZuM
 6DZWOjxgWyIEvIeL7Gc976oonmjoY3HIceHHbwHi72bdnd2Gy+AWDEjKmA0WKHQ0CELOyD3
 xLnU0oKxZOds2XaKZjWN/+cAkATrBuJlSJHbhDH0nCttt8tD52gDip/JCkLGmF9g5w8sHqC
 GkJN8GHNKWsuhjUFrVHNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eEWI9N1+sSQ=:MUAOZY4Ngrc5ZNOlWGZeyG
 pqP9pc6zPRXcdR6ad8Xlc+jc/mJNRz+Svfzr7MggeZQ4eDj6OQQLgRBCcikSL5USnqjUEW2m6
 CWQTp3BrwaZxxZfBpbB4N5WjczQDNDhDOq4Zhiw/d9yZmjBCFWl15FHE4Yw7tZe3OsD9XPHik
 0R3Bzs1tINPwcjUn/tYIL8ARKxF+4yYyDUwHNpwAzN4I+C4iLftcHSQmAiY3m/PcxCr0SGj/f
 v92/Cj4MYzGzv4wMgSX0gZEQ8tKREivmzKTRixKodssvflrbLcWGC6z9rkeB2lRwvE4sqQ2k6
 RGpLkQ85dvunXUzXAWY2O2cZNW2gd1M0Y+hV9g5PcQYW5XXURp2SahMbiHxRJD3SqnNLL0TP5
 AEwRNCFXr0n2ytyl7yOjHZUx5p7iAXiMycNMCmgLe/yk2sl+z24zHY/7mpJGIzQSmR5SiY7iJ
 c1eTW+cCdCN+QQbxuB2ejtjLjSlSd4/V38A0HyKe2Pihq6/hibzabFGY97qrqLkOa5j+6ytfY
 SI2/UUA63c2utNAC4Pf+6X1sLgLOQXpSGOvsD20ME9W8WHyfZXE3Gt2QxvMMyiPh9byqwCs2o
 XtRlwHqpz4UBv+r6abzjlPfrHN3RJehVLXRF1vwv61Z409xa+8BMLs5GxvQUnFaBjjNj6cMsG
 H2NDDkM6RaioEStzakCkr7XcPhIw/0eOq+KqxVKKWSeFGC5vYTodArZzCe/HgZ2ML/z8KCX4p
 LvoMc/RcpnOThvUU6MFO4bvISSXSGhop94bgbRZ30uxYIGa06Gyu1RDDux6OKMYdQdq+kM6ZR
 9ozvD36JiV5Ynq1VumV8SSjmd7hMyKeCv9GGg4gh9UAQIXTlyBcBkhcnATofgc5dZhl/fFIrG
 apDn2e0weD8Qpta82xhkPEyV3eM+8eHD1XbAKarChCaFU+FtBuLcCI9yXwDtsqR2PqXJkchLX
 nkz07bbCfKZGvPGTOpE8Pr7jrXB1lMYEv+rXjI5E+y632R7B5CHDLfZqz4Jxhnsjzf/9+8UX9
 2tpkU4324OelND7dC7BLMQWSLkGV7RU7pLqYHUvmE0L1uK4cVtn5zg+6Qa/dDVyfhCiVF306W
 rVFnq0DtdWAPmE=
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Paul Mackerras <paulus@samba.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2021-11-11 at 04:47 +0100, Mike Galbraith wrote:
>
> So I suppose the powerpc spot should remain CONFIG_PREEMPT and become
> CONFIG_PREEMPTION when the RT change gets merged, because that spot is
> about full preemptibility, not a distinct preemption model.

KCSAN needs a little help to be usable by RT, but ditto that spot.

	-Mike
