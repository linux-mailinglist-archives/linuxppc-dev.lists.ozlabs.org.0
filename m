Return-Path: <linuxppc-dev+bounces-1457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B14DA97C4AD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 09:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8RY555WYz2yD5;
	Thu, 19 Sep 2024 17:12:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726726557;
	cv=none; b=J+H/u1vFSXZO9wNkVQpDphLG2MT/7oSYAat8LX+ndLX3W88/djalUSSi8xWG7HncwhbwnSb00+OT8UbZ38Etl3RHSipEwgp+0eggOkrWwKMnnou0VjIvdtMiBZkAubuRcZohcCy4wxL3dvFA3vAO/3r50NuM+vEBQ36mzwNhyxP41sYaTSFxft5mqkyTMwX4AABzeG4zUOHM4NblPTqhvLowxaAhzU5v3kFNPrtbDaJo+NYULMhE56J8Y4qYs116DMnxjiRQL6XrZRwHqkI9GBJCL8494bk+QuxBLtQhHubexhNQ/KUMQalIHUu6YlNI+sppZPTyOarK8mgsFeAiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726726557; c=relaxed/relaxed;
	bh=LJb5IgePZ4BgrdGP9a6NUaWhuwLLTGAN/jzME6Q2d6A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XAwBU9sepNErbBy/uZvjHcaXM+lXHuM4IAOPp1Z4uXlvlcZeAKZYmcF/4/z2natnNj7+NrLLdzcpXJ/WNOLFLXL1mRWpzI1PbFO8MI/utkB4S8fk7XRvifsNsbN9Jo5mwBNpX4t2Wj2I/xmdI0NBadhE7PWj/wA4PBCYQIzPWXqrIO1sDK7JouotADZsXT0OP7LVzyG/ccmnhZEz52X2Su67aO7Bxj6rMjol3pulS5J3V4b6BSJrVMntcklzBLRW5Eym3e4h3L5AUV5yOjnVGgh9GAj6mqIVToaqV8nnRUdEeDF96Q0udU60AaacazA8tMeWkYoHorgZZDDnoXderA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Tu5UJABH; dkim-atps=neutral; spf=pass (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=efault@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Tu5UJABH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=efault@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 333 seconds by postgrey-1.37 at boromir; Thu, 19 Sep 2024 16:15:54 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8QHt4S67z2y8R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 16:15:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1726726550; x=1727331350; i=efault@gmx.de;
	bh=LJb5IgePZ4BgrdGP9a6NUaWhuwLLTGAN/jzME6Q2d6A=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Tu5UJABHNliEvPXOj5bHGkNUaN7gfPSjkKyOf9Y8M8q3XvOhILqBX77mqSXRSNvO
	 Ik8gxK4mf2he22TXGJsIZsxSNEiTm38MhEwejb8wpOL3j4yMOOqwWWxlVXdXAUP/L
	 8WKdljOQcYEkhLrLVVf+0a59FxiEWxHFXBOQLWBMtZ0RHpt3hKILQWU4EzlX1Nak6
	 6M3LouaQMA19o/H5boRqRiUzS3XBnB8+XC7gme3LYyWePdBRtP1kI5uJatp+Dgxmc
	 hofOAPNj8CrdTGfGwigAu2Akmny6+gOrmdCXJnBO1qwM8+uZZQULb9aDo4Z79M+FT
	 9we3/vkjRT8nyp3Caw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([91.212.106.56]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKFu-1shqxC3d6g-004GNr; Thu, 19
 Sep 2024 08:09:48 +0200
Message-ID: <2fb24ab402d9de45e3cf16e6ba0ad23a7843e5c1.camel@gmx.de>
Subject: [patch] Re: [PowerPC][Linux-next][6.11.0-rc4-next-20240820] OOPs
 while running LTP FS Stress
From: Mike Galbraith <efault@gmx.de>
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 peterz@infradead.org, vschneid@redhat.com, mingo@kernel.org,
 sfr@canb.auug.org.au
Date: Thu, 19 Sep 2024 08:09:47 +0200
In-Reply-To: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
References: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zXiz7bdk1O2092M+28wKsKOHNyhGwevFOgeHjWiyixY3kKbkF80
 q7f3jlBj+9u7JO6xwYWvhE7kaUeZxkf8JlcgwnNgFDoO9UY11S1Edb+4jGnS1KE+wgd0wB6
 pPLUV/aRLuksGSrm1dAQX7VWS8gyHsmugR3ml5/qrSO0psnhlsrz7gOvpw5fB7y+S92AZ8+
 jBnk5qcFCvDawigeur35w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ISFuX3WU798=;4km2KO8oWeu9Y8qxQfl2WBbaPch
 1xuiXEoRgyWOHks2EkoOZEkeOK8UPq+/GLDcPtkHKX+4jEmFi5hWBsZuXytteZBNIq41I05fr
 wVZwDt2THoTeVDtAbVIfYKjS80GMDz3JKlOEv/+dzd+AO2j0Iw8RbbeHsaXvmzXph3y17yU8H
 EV0fHX0pnNLfVBmyvr5YE4jKrVq3I3FlTczrMOsb0VNbvs85uXXwHwwVH9G0+TfXjoopFujyo
 o7acL63Q22xdFnEPOgCq7Jtnb916KzllP4/+idK49V5FBvIGOGoBpvH1AOfUkdRJ1be3C11rN
 +gzbjLyGxq9dDCvZOGawvtSl34goRxK2df2doeIne1xO/MkNTB2fzntgOqQgZtfYJrhMu8QZt
 VIlt7LXiwfqhrSlbRzPSEyZ3vOczpFtQr9654HHw0Qr5N4GuhK2l6l2fNCu7NZENjxIGlmVuj
 /DkcaRPzeinbLXiLxT/DZHmBy7MXg5uDe69uqjD9ZLt7TgpRqPwrVnzGSVnFlh1YSamhARc2f
 jErr4M19TlDDDPbUaCY05A5rermH3JOyfbQRWbFGWOrL0ZQyRV+amMxGG3WkaQP0f3/uK2o1n
 xOZfu7FbheWCEZ3wS2ArXzGyPYLtTNRSkJi/Qej7KnRCsd5qa1w+1D/pcOnlrZRK6w9hnjICx
 72ImaiWpdr8UbS2a8C1KOWkkjG/uiYdZU4wzP89uZRXyGEeMFpeaY8sarGO3r9SNE5Bzkinbp
 50eq5uNXwfSrusY/6N2hLzYJi+Vf1inSyORN4F4hbPvwrKCf7yE8I6YT0J/8RsuAcctqIFdTD
 KmwLql5lPbsS3uRxF0PQgdCw==

On Mon, 2024-09-16 at 12:00 +0530, Venkat Rao Bagalkote wrote:
> Greetings!!!

Greetings,

> I am seeing below kernel crash from 6.11.0-rc4-next-20240820.
>
>
> Tried to do git bisect, but it didnt point to right patch. Attached is
> the bisect log.
>
> Any help in fixing this is much appriciated.

I met this, as well as other ways the wheels can fall off that turned
out to have the same root.  I gave Peter a heads up with diag offline,
but having now convinced myself that all is well, I'll go ahead and
post a patchlet.

At the very least it's worth putting out for wider testing.. and should
anyone have something prettier in mind, yeah, do that instead.

sched: Fix sched_delayed vs cfs_bandwidth

Meeting an unfinished DELAY_DEQUEUE treated entity in unthrottle_cfs_rq()
leads to a couple terminal scenarios.  Finish it first, so ENQUEUE_WAKEUP
can proceed as it would have sans DELAY_DEQUEUE treatment.

Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Signed-off-by: Mike Galbraith <efault@gmx.de>
=2D--
 kernel/sched/fair.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

=2D-- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6049,10 +6049,14 @@ void unthrottle_cfs_rq(struct cfs_rq *cf
 	for_each_sched_entity(se) {
 		struct cfs_rq *qcfs_rq =3D cfs_rq_of(se);

-		if (se->on_rq) {
-			SCHED_WARN_ON(se->sched_delayed);
-			break;
+		/* Handle any unfinished DELAY_DEQUEUE business first. */
+		if (unlikely(se->on_rq && se->sched_delayed)) {
+			int flags =3D DEQUEUE_SLEEP | DEQUEUE_SPECIAL;
+
+			dequeue_entity(qcfs_rq, se, flags | DEQUEUE_DELAYED);
 		}
+		if (se->on_rq)
+			break;
 		enqueue_entity(qcfs_rq, se, ENQUEUE_WAKEUP);

 		if (cfs_rq_is_idle(group_cfs_rq(se)))


