Return-Path: <linuxppc-dev+bounces-4725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A0A030F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 20:53:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRlHT2DsLz30VM;
	Tue,  7 Jan 2025 06:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736193237;
	cv=none; b=N6KHQsTY9pNfsx1aclHuYkzDR456RDcpAOS3uaAtVSFRQIa/iOh4upPK5kG9k4enNruTSByCzjs8zsnjPXKb5NmtnLaC7R66KEXi2u9T8T4q2vKv2SaiJgEPR5q+g3pIztdsbj+K1d4Q4o6EuF2uVS3tNilyRxSqlrRCW/L6tZM6aQwKqURh/Rql3lSgwQlu6UuTgQNysdrw3dw8Lzb1q2R9N8N0aoj6P3rbFC2Ic4TjS2MFYZvOSgakufeUAx8QYnHT14T4+xpQ95fUldxCBQ1zGzWe3A3qS02zq2VAjz+oC3qfXcQTIuxDz07GTWulQ8J8bXUrGYBFBj7UkYoAUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736193237; c=relaxed/relaxed;
	bh=KcRnOliVbPNnDerGTJx1m+xAYvr2alYi62GnOrQGtCY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=X9/OAoNO3aeUYUhWk3rfFX3ATt37jrmVJL2JnHL6aPt6Rs+6kKdo6XRIHaqCIFqSuZFb3gCj5M0GlSyP+7cym1YjTEfYeGUCK1zkUq+NFrAUHdVnv2uvS0H6nDN8++CUN6Rh7AV/GznIElpzRPhgwTihi1T4as1DbJwCefnB8+lCWUjZBE7KuTBeFBsCrsCedHKDKfgWDKSPrEmVhloqnJvTzjRhXSwitZXPjxOhxYUUglyVYFfw8qD63HoYFr1nYOyKd7FNcfSKDlRyvF4jwgBGkdzSkU0pwqzasnsnSjWVW5qlCchgkIou/orMt5dlG0C+96Fgn1m24DgmqfxyuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=BTF9JbDr; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=BTF9JbDr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=sanastasio@raptorengineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 355 seconds by postgrey-1.37 at boromir; Tue, 07 Jan 2025 06:53:54 AEDT
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRlHQ3802z2xn3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 06:53:54 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6E109828840C;
	Mon,  6 Jan 2025 13:47:52 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id uM6_vjIp4ZJe; Mon,  6 Jan 2025 13:47:51 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id C584A828840D;
	Mon,  6 Jan 2025 13:47:51 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C584A828840D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1736192871; bh=KcRnOliVbPNnDerGTJx1m+xAYvr2alYi62GnOrQGtCY=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=BTF9JbDrbhsfSd5jo7qDUIra0f0GDGdKbLW7dxP/+19MbewFHIYHPL0KUzK0aDbR0
	 NyrZKXdpV7myVytWc8H742fp4E/gVctbpQ1Yw4n2AJrzkMFJOJsSn9rJpPLReKHQmU
	 Ru5YDu5qr852s06HasKdo0CL7mUk4McMtfNiaAfk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eXzVAU9ak-L2; Mon,  6 Jan 2025 13:47:51 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
	by mail.rptsys.com (Postfix) with ESMTPSA id 4C15A828840C;
	Mon,  6 Jan 2025 13:47:51 -0600 (CST)
Message-ID: <8dd4546a-bb03-4727-a8c1-02a26301d1ad@raptorengineering.com>
Date: Mon, 6 Jan 2025 13:47:50 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Raptor Engineering dedicating resources to KVM on PowerNV + KVM CI/CD
To: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi all,

Just wanted to check in and let the community know that Raptor
Engineering will be officially dedicating development resources towards
maintaining, developing, and testing the existing Linux KVM facilities
for PowerNV machines.

To this end, we have developed a publicly-accessible CI/CD system[1]
that performs bi-hourly automated KVM smoke tests on PowerNV, as well as
some more advanced tests involving PCIe passthrough of various graphics
cards through VFIO on a POWER9/PowerNV system. Access can also be
provided upon request to any kernel developers that wish to use the test
system for development/testing against their own trees.

If anybody has any questions about the test system, or any insights
about outstanding work items regarding KVM on PowerNV that might need
attention, please feel free to reach out.

Thanks,
Shawn

[1]
https://gitlab.raptorengineering.com/raptor-engineering-public/kernel/kernel-developers-ci-cd-access/linux/-/pipelines/1075


