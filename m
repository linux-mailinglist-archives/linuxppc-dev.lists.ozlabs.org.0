Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B594381F48A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 05:16:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=j2PX6bsz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0wDW3SLJz30ht
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 15:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=j2PX6bsz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0wCg4z11z30MD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 15:15:27 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BF0A882850C9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 22:15:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vegY2gLU3In7 for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 27 Dec 2023 22:15:25 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2F4DE82850CB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 22:15:25 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2F4DE82850CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1703736925; bh=ZBUD/PzSEyP0fMBTpJ6tfoHL0HkfKim5SZ6kImsEwk8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=j2PX6bszNdzkAn8dsOVgu/wwnfOWOuVzl5WAznXUrl8RJ5nQPpUMHZt0D/UAixmuc
	 P4Vjruf4gFud6I3l8L/TniwzFZRBxizB+ik6Xk0ZnIjYdyACg1MqVtlstNxTZXlTZ5
	 B5h5auRkk4z7T36Q28n00HgsLnJt7wGG7E3hW8NY=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K7IclqznvD2r for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 27 Dec 2023 22:15:25 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1011A82850C9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 22:15:25 -0600 (CST)
Date: Wed, 27 Dec 2023 22:15:24 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <674182417.2124034.1703736924982.JavaMail.zimbra@raptorengineeringinc.com>
Subject: PowerNV PCIe hotplug support?
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC112 (Linux)/8.5.0_GA_3042)
Thread-Index: hMP2kkUFF0gjw2HUkQhVOS3bUJ+WaQ==
Thread-Topic: PowerNV PCIe hotplug support?
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I've been evaluating some new options for our POWER9-based hardware in the NVMe space, and would like some clarification on the current status of PCIe hotplug for the PowerNV platforms.

From what I understand, the pnv_php driver provides the basic hotplug functionality on PowerNV.  What I'm not clear on is to what extent this is intended to flow downstream to attached PCIe switches.

I have a test setup here that consists of a PMC 8533 switch and several downstream NVMe drives, with the switch attached directly to the PHB4 root port.  After loading the pnv_php module, I can disconnect the downstream NVMe devices by either using echo 0 on /sys/bus/pcu/slots/Snnnnnnn/power, or by doing a physical surprise unplug, however nothing I try can induce a newly plugged device to train and be detected on the bus.  Even trying a echo 0 and subsequent echo 1 to /sys/bus/pcu/slots/Snnnnnnn/power only results in the device going offline, there seems to be no way to bring the device back online short of a reboot.

Hotplug of other devices connected directly to the PHB4 appears to work properly (I can online and offline via the power node); the issue seems to be restricted to downstream devices connected to the (theoretically hotplug capable) PMC 8533 switch.

Is this the intended behavior for downstream (non-IBM) PCIe ports?  Raptor can provide resources to assist in a fix if needed, but I would like to understand if this is a bug or an unimplemented feature first, and if the latter what the main issues are likely to be in implementation.

Thank you!
