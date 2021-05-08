Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 018EE377453
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 00:16:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fd1rN4CRSz306H
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 08:16:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=noureddine.xyz header.i=@noureddine.xyz header.a=rsa-sha256 header.s=mail header.b=OtaRo+vb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=noureddine.xyz (client-ip=64.52.23.98; helo=mail.noureddine.xyz;
 envelope-from=contact@noureddine.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=noureddine.xyz header.i=@noureddine.xyz
 header.a=rsa-sha256 header.s=mail header.b=OtaRo+vb; 
 dkim-atps=neutral
X-Greylist: delayed 455 seconds by postgrey-1.36 at boromir;
 Sun, 09 May 2021 07:45:47 AEST
Received: from mail.noureddine.xyz (unknown [64.52.23.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fd18W1Htjz2yYK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 07:45:46 +1000 (AEST)
Received: from [192.168.1.102] (unknown [105.191.3.241])
 by mail.noureddine.xyz (Postfix) with ESMTPSA id 770C01405F9;
 Sat,  8 May 2021 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noureddine.xyz;
 s=mail; t=1620509858;
 bh=CdBDoEVxNcdj1d8lrKJjyhicLwdsZOU5WWW/useIVxo=;
 h=To:Cc:From:Subject:Date:From;
 b=OtaRo+vbhf+UMfP+nypWu+bKwcZ4k8T2hND0VloPMvbgI76VuGvP4dZDdeDCMykLw
 17U0EZ18DkAmQBjUaeUDhUMCTRbaWzRuIT9b/jB0z8lvjnjOGfjYwlLfy8mBHXG79V
 Cz2mGHJtXg/5wz7Y5R1lppjh+hummjpW6d4L9uVqq4MO+nsLwzwKr6b6ei09dMjqVf
 BHX+RwlHSOJVyX2lagFUFg90lUcr7zyyQ2S0SL90F/5c60XeGXRJupoediDhFvRWjW
 AgGklFcrv6wMJVVVOG3/PqeQ7IODX6bAEqSwbn1SexN8qGoeNtT+iaUZF7TuB4NuTE
 9Vf0MhEPSyCbQ==
To: paulus@ozlabs.org, mpe@ellerman.id.au, benh@kernel.crashing.org
From: Nour-eddine Taleb <contact@noureddine.xyz>
Subject: [PATCH] arch: powerpc: kvm: remove unnecessary casting
Message-ID: <34d93da2-4b0c-8806-54e7-5bcaeab4f2d5@noureddine.xyz>
Date: Sat, 8 May 2021 21:37:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 09 May 2021 08:16:31 +1000
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
Cc: noureddine <contact@noureddine.xyz>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

remove unnecessary castings, from "void *" to "struct kvmppc_xics *"

Signed-off-by: Nour-eddine Taleb <contact@noureddine.xyz>
---
  arch/powerpc/kvm/book3s_xics.c        | 2 +-
  arch/powerpc/kvm/book3s_xive.c        | 2 +-
  arch/powerpc/kvm/book3s_xive_native.c | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 303e3cb096db..9ae74fa551a6 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -1440,7 +1440,7 @@ static int kvmppc_xics_create(struct kvm_device 
*dev, u32 type)

  static void kvmppc_xics_init(struct kvm_device *dev)
  {
-	struct kvmppc_xics *xics = (struct kvmppc_xics *)dev->private;
+	struct kvmppc_xics *xics = dev->private;

  	xics_debugfs_init(xics);
  }
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index e7219b6f5f9a..05bcaf81a90a 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2242,7 +2242,7 @@ static void xive_debugfs_init(struct kvmppc_xive 
*xive)

  static void kvmppc_xive_init(struct kvm_device *dev)
  {
-	struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
+	struct kvmppc_xive *xive = dev->private;

  	/* Register some debug interfaces */
  	xive_debugfs_init(xive);
diff --git a/arch/powerpc/kvm/book3s_xive_native.c 
b/arch/powerpc/kvm/book3s_xive_native.c
index 76800c84f2a3..2703432cea78 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1265,7 +1265,7 @@ static void xive_native_debugfs_init(struct 
kvmppc_xive *xive)

  static void kvmppc_xive_native_init(struct kvm_device *dev)
  {
-	struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
+	struct kvmppc_xive *xive = dev->private;

  	/* Register some debug interfaces */
  	xive_native_debugfs_init(xive);
-- 
2.30.2

