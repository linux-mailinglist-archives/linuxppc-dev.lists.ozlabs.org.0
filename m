Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 141CC1A0563
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 05:47:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xCzW6R6WzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 13:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xCxq2Fm5zDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 13:46:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CueAiY1L; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48xCxg52gKz9sR4;
 Tue,  7 Apr 2020 13:46:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586231183;
 bh=l7KUz8zonmbflimP1h+qknSpc6ld96yDXbEMfnRnCqQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=CueAiY1LX33npSQ9uQbMc52KhJLtkPPnFAs89+F9WT7du9ALrPlU6IMuYH+rvZsjm
 yGxU1Rjz3dyQjphXVFv7lslvM49Co2tfHU1JaSCi71deG6dVvqN9VLJpRprKObQuGd
 ZR7AIK5m1ztVgCajEG0rsVMDqQBiZ6yiQdSlg611TgUDkfeHHBrQma8qKKFgmZ3e4i
 WEHa6vB01klqAFAq+ZoWhnuDBmKvCKFxbgUqcQ3EWGAP73MW0zCbqls4fU2WbTqdjV
 uxfwPc8V71pAFebW85SCuu/Divkkzn/OB3q1E/9I+E5nCfeajK2d3qB/6n35cTHADB
 MWg/IHw5lvIZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Don't generate thousands of new warnings when
 building docs
In-Reply-To: <cover.1584716446.git.mchehab+huawei@kernel.org>
References: <cover.1584716446.git.mchehab+huawei@kernel.org>
Date: Tue, 07 Apr 2020 13:46:23 +1000
Message-ID: <87lfn8klf4.fsf@mpe.ellerman.id.au>
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
Cc: Ricardo Ribalda Delgado <ribalda@kernel.org>, target-devel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Alex Shi <alex.shi@linux.alibaba.com>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, x86@kernel.org,
 Tyler Hicks <code@tyhicks.com>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Luca Ceresoli <luca@lucaceresoli.net>, Johannes Berg <johannes.berg@intel.com>,
 ecryptfs@vger.kernel.org, Matthias Maennich <maennich@google.com>,
 dmaengine@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Harry Wei <harryxiyou@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> This small series address a regression caused by a new patch at
> docs-next (and at linux-next).
>
> Before this patch, when a cross-reference to a chapter within the
> documentation is needed, we had to add a markup like:
>
> 	.. _foo:
>
> 	foo
> 	===
>
> This behavor is now different after this patch:
>
> 	58ad30cf91f0 ("docs: fix reference to core-api/namespaces.rst")
>
> As a Sphinx extension now creates automatically a reference
> like the above, without requiring any extra markup.
>
> That, however, comes with a price: it is not possible anymore to have
> two sections with the same name within the entire Kernel docs!
>
> This causes thousands of warnings, as we have sections named
> "introduction" on lots of places.
>
> This series solve this regression by doing two changes:
>
> 1) The references are now prefixed by the document name. So,
>    a file named "bar" would have the "foo" reference as "bar:foo".
>
> 2) It will only use the first two levels. The first one is (usually) the
>    name of the document, and the second one the chapter name.
>
> This solves almost all problems we have. Still, there are a few places
> where we have two chapters at the same document with the
> same name. The first patch addresses this problem.

I'm still seeing a lot of warnings. Am I doing something wrong?

cheers

/linux/Documentation/powerpc/cxl.rst:406: WARNING: duplicate label powerpc/cxl:open, other instance in /linux/Documentation/powerpc/cxl.rst
/linux/Documentation/powerpc/cxl.rst:412: WARNING: duplicate label powerpc/cxl:ioctl, other instance in /linux/Documentation/powerpc/cxl.rst
/linux/Documentation/powerpc/syscall64-abi.rst:86: WARNING: duplicate label powerpc/syscall64-abi:parameters and return value, other instance in /linux/Documentation/powerpc/syscall64-abi.rst
/linux/Documentation/powerpc/syscall64-abi.rst:90: WARNING: duplicate label powerpc/syscall64-abi:stack, other instance in /linux/Documentation/powerpc/syscall64-abi.rst
/linux/Documentation/powerpc/syscall64-abi.rst:94: WARNING: duplicate label powerpc/syscall64-abi:register preservation rules, other instance in /linux/Documentation/powerpc/syscall64-abi.rst
/linux/Documentation/powerpc/syscall64-abi.rst:103: WARNING: duplicate label powerpc/syscall64-abi:invocation, other instance in /linux/Documentation/powerpc/syscall64-abi.rst
/linux/Documentation/powerpc/syscall64-abi.rst:108: WARNING: duplicate label powerpc/syscall64-abi:transactional memory, other instance in /linux/Documentation/powerpc/syscall64-abi.rst
/linux/Documentation/powerpc/ultravisor.rst:339: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:351: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:365: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:387: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:406: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:416: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:429: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:438: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:452: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:462: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:477: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:484: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:514: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:521: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:527: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:545: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:561: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:573: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:588: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:594: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:613: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:622: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:633: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:639: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:650: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:658: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:669: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:674: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:688: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:697: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:708: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:721: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:737: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:746: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:757: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:771: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:782: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:789: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:798: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:808: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:819: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:828: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:842: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:849: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:886: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:893: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:900: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:909: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:921: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:928: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:938: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:944: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:957: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:964: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:980: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1002: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1017: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1027: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1037: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1053: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1076: WARNING: duplicate label powerpc/ultravisor:syntax, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1086: WARNING: duplicate label powerpc/ultravisor:return values, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1096: WARNING: duplicate label powerpc/ultravisor:description, other instance in /linux/Documentation/powerpc/ultravisor.rst
/linux/Documentation/powerpc/ultravisor.rst:1105: WARNING: duplicate label powerpc/ultravisor:use cases, other instance in /linux/Documentation/powerpc/ultravisor.rst
