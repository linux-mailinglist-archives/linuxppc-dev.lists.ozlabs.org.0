Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 303211F494F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 00:20:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hPhZ3klwzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 08:20:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=nyEWkzz4; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hPfQ4Cz8zDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 08:18:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591741126;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZYUXpYm2P8uRR9KFAOzf/LSgzerMnh8pclM0qac0eu4=;
 b=nyEWkzz4uRlKgl1K3qn3OaTTvos4FTePLJQtsys2lW919OfhWPppo3N3dBpNyqiMdp
 sdt4oxtHfCBBi4tsveA7L5Vvmk/VHVHSD68sAPy2o1jT2LeKkme6Ikc4QXc4kFSfTpUT
 kHxS0yPMnE5KGjVHy4Pcl+jBA/f9PMfthnGqUoF0gAsj8gPfbtYoY0EO8OB8s6mZJyWW
 3Kkg8R2xDTM2IvfUVUO6ogpKs4+194VoelXUCrM9Gzh9GwbgaGleWdsZFqDxk+yJIbH+
 6XxfB0jGrPHfPUGU1rOa9BugI51EWJNK/reO6FhWEF6yr1M3TDiXaBExMEChJruDoERg
 Snaw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSI1Vi9hdbute3wuvmUTfEdg9AyQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:15f9:f3ba:c3bc:6875]
 by smtp.strato.de (RZmta 46.9.1 AUTH) with ESMTPSA id w06ffew59MIiXfv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 10 Jun 2020 00:18:44 +0200 (CEST)
Subject: PowerPC KVM-PR issue
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <f7f1b233-6101-2316-7996-4654586b7d24@csgroup.eu>
 <067BBAB3-19B6-42C6-AA9F-B9F14314255C@xenosoft.de>
 <014e1268-dcce-61a3-8bcd-a06c43e0dfaf@csgroup.eu>
 <7bf97562-3c6d-de73-6dbd-ccca275edc7b@xenosoft.de>
 <87tuznq89p.fsf@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <f2706f5f-62b8-9c52-08f4-59f91da48fa6@xenosoft.de>
Date: Wed, 10 Jun 2020 00:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87tuznq89p.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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
Cc: Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

KVM-PR doesn't work anymore on my Nemo board [1]. I figured out that the 
Git kernels and the kernel 5.7 are affected.

Error message: Fienix kernel: kvmppc_exit_pr_progint: emulation at 700 
failed (00000000)

I can boot virtual QEMU PowerPC machines with KVM-PR with the kernel 5.6 
without any problems on my Nemo board.

I tested it with QEMU 2.5.0 and QEMU 5.0.0 today.

Could you please check KVM-PR on your PowerPC machine?

Thanks,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
