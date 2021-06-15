Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643383A80EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48bX0khhz3gfC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:40:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KMNY2Z73;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KMNY2Z73; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48T81cyNz3fcb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:35:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G48T43GNjz9t1s
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:35:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623764120;
 bh=f+pAIeUvCGS8IgI11tBxPnZcN1hRhb6FByqbKIzyQjI=;
 h=From:To:Subject:Date:From;
 b=KMNY2Z73Xu0n28fWb4uCCDJZQ1RhzX7ZT7M6Hxb3ipO6cXGvY4uO4lfUy6sZCZDPw
 rI/1r9GHcsSd7H6OTRlaug5Xxpt9TQofZpg/AULlHoKtfm8fwyGf+ovlsGyNb1pGy5
 0/JZ+EjDEGuFlFBkPU4fMF5WHyn5gvnLh9wb0OQm0i4Na9lMZZSzDMiPrCOcFHCtja
 S4a3BkzkmoAcvtqc2kvDCVYLH036C8G03VPK/S++QEYvkI5xe4z4Hvuycr3CCK3sj4
 dfuvAnbW7SaSCXqF0FYlICAkAxDK5xdQOG0RVsxmRMVrU3dZD/gpB+Tbb7oxw2xNS3
 Bsv3WNmVqVFkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Testing with Github Actions
Date: Tue, 15 Jun 2021 23:35:19 +1000
Message-ID: <87h7hztfmw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi all,

I've setup automated builds + qemu boot tests using Github Actions.

You can see the results here:

  https://github.com/linuxppc/linux-ci/actions


You can use it for testing your own patches before submitting them by
doing the following:

  - Fork the linuxppc/linux-ci repo on github. (Note not the main linux repository)
  - Enable GitHub Actions for your forked repository
  - Add your work on top of the merge branch (or create a branch based on merge)
  - Push to your fork of linux-ci on GitHub
  - Results should appear in the Actions tab of your repository


Using it is entirely optional, I know not everyone likes to use Github.

But if you're sending a significant number of powerpc patches then
testing them before submission using this setup can save us all some
time :)

If you have any problems or questions let me know.

cheers
