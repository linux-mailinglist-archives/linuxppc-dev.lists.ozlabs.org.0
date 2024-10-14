Return-Path: <linuxppc-dev+bounces-2181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B08599BF53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 07:20:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRltp0p05z30BW;
	Mon, 14 Oct 2024 16:20:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728883250;
	cv=none; b=fe+AcIBYjIvL2p6z8zsUbsoBtmzZHJqS+S+CEhmBqyZHQSf211n6rvEPEVovqvL3deA0jiQrpnLvKkZ1STpJ/X0n6DPpCf8681p3/gHTrJhOhXiUEu4zYNMVElemJi5IqVemffU4k+h/YyP+oP6Fq9mKnPfOasdgONmyfozJ7L7PfFS+SJOtQBH7nYuXKJHwXRdIgokCk1+XoLamlXpZ9oi6JbcMcGrIMrrN/uzKrIkMNb2wVPqiVsBaTsKCh8U7q2pLq9HAFeyACgo1as2uYO815J4KCqzZVX1EIUKjP5ueUtyGqUIX/uTKUKTm1Fbcc+3fHMx2GFRqThRKln2hVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728883250; c=relaxed/relaxed;
	bh=DtSl2gjkL4b4viqV66J3GUu4iiCHJl1K/3o+41OOg58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o0/KEEKdHMSLB+14RrI/zyTSxYFf8xC6mgNqYi2OdlkFHzXPUYS7cvxiMvcOPImfOfVX5ll0nLV4sRAbm5DNp/cy/nKJL3v0S+T0GppI81l6qLsrZk/dqiHkLZs77NBEKyd1mLjaoJ0zdl1LYiO1KK8Cbd6Lc45UgMe90HWYLuxJd6G9QYjZ+imiRooYhe+gHDSy//G9aiqr4qKIWDcGGGdCNgaxVwGofIvDMzief87Xj8G0WY7P6dimDUhX3yVgPKqpCoDowxtrl+J9jSHAKhKzaaJyf8dtW40XjwQSwHPU8ae8B6wrou700IdrdCYXy61qNAvlV5Ny7fy1QXSXRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q88VBKgd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q88VBKgd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRltm3sCrz2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 16:20:47 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E4R04O013639;
	Mon, 14 Oct 2024 05:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:mime-version:content-type; s=pp1;
	 bh=DtSl2gjkL4b4viqV66J3GUu4iiCHJl1K/3o+41OOg58=; b=Q88VBKgd+XIY
	Au0YbhYyyDfWlEGqCmhcfItKw0qS447iRv+X0PxFXLveObu38bLKKZ3vyEL3DGG4
	IB09kYNlOCWhgHN6tDTqyTs6Lg5g+1F7IaRA9Oh47K4hj7UfmNFLTy4flKTCxCU4
	VYuFx8prm8r+VRAzpwmiQD27zo2MqksCMRfnM+D3sxKufhgsI93adf88BYaWsvhg
	QQPurXuQhZMdaAmw5yh/XY4kqJq5GymfyFU2OiRDFeHQEawzcjHfc25fGGc0bXib
	mGTdGbyIeVYWJX88t8lI7vIBezfwRiNK2x7NSJnajPyDusb9n1OfGYFwvO3rjW7h
	Qb04wlRbXg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428v8cr6mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 05:20:25 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49E5KPRw016439;
	Mon, 14 Oct 2024 05:20:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 428v8cr6m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 05:20:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49E1ubTm006671;
	Mon, 14 Oct 2024 05:20:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4283ermxam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 05:20:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49E5KLDJ56099284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 05:20:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E98462004E;
	Mon, 14 Oct 2024 05:20:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A05820043;
	Mon, 14 Oct 2024 05:20:18 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.109.245.217])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 14 Oct 2024 05:20:18 +0000 (GMT)
Date: Mon, 14 Oct 2024 10:50:15 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] crypto/nx: Rename devdata_mutex to devdata_spinlock
Message-ID: <ZwyqD-w5hEhrnqTB@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fc_jBgneAtBFhAQ8nacSdxGD03Y4b6wc
X-Proofpoint-ORIG-GUID: uFxA-QBAyPs8eUKlluc5LuNMXhvql8G5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_04,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=784 adultscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140037
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rename devdata_mutex to devdata_spinlock to accurately reflect its
implementation as a spinlock.

Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 drivers/crypto/nx/nx-common-pseries.c | 34 +++++++++++++--------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 35f2d0d8507ed..a0eb900383af7 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -133,7 +133,7 @@ struct nx842_devdata {
 };

 static struct nx842_devdata __rcu *devdata;
-static DEFINE_SPINLOCK(devdata_mutex);
+static DEFINE_SPINLOCK(devdata_spinlock);

 #define NX842_COUNTER_INC(_x) \
 static inline void nx842_inc_##_x( \
@@ -750,15 +750,15 @@ static int nx842_OF_upd(struct property *new_prop)
        if (!new_devdata)
                return -ENOMEM;

-       spin_lock_irqsave(&devdata_mutex, flags);
+       spin_lock_irqsave(&devdata_spinlock, flags);
        old_devdata = rcu_dereference_check(devdata,
-                       lockdep_is_held(&devdata_mutex));
+                       lockdep_is_held(&devdata_spinlock));
        if (old_devdata)
                of_node = old_devdata->dev->of_node;

        if (!old_devdata || !of_node) {
                pr_err("%s: device is not available\n", __func__);
-               spin_unlock_irqrestore(&devdata_mutex, flags);
+               spin_unlock_irqrestore(&devdata_spinlock, flags);
                kfree(new_devdata);
                return -ENODEV;
        }
@@ -810,7 +810,7 @@ static int nx842_OF_upd(struct property *new_prop)
                        old_devdata->max_sg_len);

        rcu_assign_pointer(devdata, new_devdata);
-       spin_unlock_irqrestore(&devdata_mutex, flags);
+       spin_unlock_irqrestore(&devdata_spinlock, flags);
        synchronize_rcu();
        dev_set_drvdata(new_devdata->dev, new_devdata);
        kfree(old_devdata);
@@ -821,13 +821,13 @@ static int nx842_OF_upd(struct property *new_prop)
                dev_info(old_devdata->dev, "%s: device disabled\n", __func__);
                nx842_OF_set_defaults(new_devdata);
                rcu_assign_pointer(devdata, new_devdata);
-               spin_unlock_irqrestore(&devdata_mutex, flags);
+               spin_unlock_irqrestore(&devdata_spinlock, flags);
                synchronize_rcu();
                dev_set_drvdata(new_devdata->dev, new_devdata);
                kfree(old_devdata);
        } else {
                dev_err(old_devdata->dev, "%s: could not update driver from hardware\n", __func__);
-               spin_unlock_irqrestore(&devdata_mutex, flags);
+               spin_unlock_irqrestore(&devdata_spinlock, flags);
        }

        if (!ret)
@@ -1045,9 +1045,9 @@ static int nx842_probe(struct vio_dev *viodev,
                return -ENOMEM;
        }

-       spin_lock_irqsave(&devdata_mutex, flags);
+       spin_lock_irqsave(&devdata_spinlock, flags);
        old_devdata = rcu_dereference_check(devdata,
-                       lockdep_is_held(&devdata_mutex));
+                       lockdep_is_held(&devdata_spinlock));

        if (old_devdata && old_devdata->vdev != NULL) {
                dev_err(&viodev->dev, "%s: Attempt to register more than one instance of the hardware\n", __func__);
@@ -1062,7 +1062,7 @@ static int nx842_probe(struct vio_dev *viodev,
        nx842_OF_set_defaults(new_devdata);

        rcu_assign_pointer(devdata, new_devdata);
-       spin_unlock_irqrestore(&devdata_mutex, flags);
+       spin_unlock_irqrestore(&devdata_spinlock, flags);
        synchronize_rcu();
        kfree(old_devdata);

@@ -1101,7 +1101,7 @@ static int nx842_probe(struct vio_dev *viodev,
        return 0;

 error_unlock:
-       spin_unlock_irqrestore(&devdata_mutex, flags);
+       spin_unlock_irqrestore(&devdata_spinlock, flags);
        if (new_devdata)
                kfree(new_devdata->counters);
        kfree(new_devdata);
@@ -1122,12 +1122,12 @@ static void nx842_remove(struct vio_dev *viodev)

        crypto_unregister_alg(&nx842_pseries_alg);

-       spin_lock_irqsave(&devdata_mutex, flags);
+       spin_lock_irqsave(&devdata_spinlock, flags);
        old_devdata = rcu_dereference_check(devdata,
-                       lockdep_is_held(&devdata_mutex));
+                       lockdep_is_held(&devdata_spinlock));
        of_reconfig_notifier_unregister(&nx842_of_nb);
        RCU_INIT_POINTER(devdata, NULL);
-       spin_unlock_irqrestore(&devdata_mutex, flags);
+       spin_unlock_irqrestore(&devdata_spinlock, flags);
        synchronize_rcu();
        dev_set_drvdata(&viodev->dev, NULL);
        if (old_devdata)
@@ -1257,11 +1257,11 @@ static void __exit nx842_pseries_exit(void)

        crypto_unregister_alg(&nx842_pseries_alg);

-       spin_lock_irqsave(&devdata_mutex, flags);
+       spin_lock_irqsave(&devdata_spinlock, flags);
        old_devdata = rcu_dereference_check(devdata,
-                       lockdep_is_held(&devdata_mutex));
+                       lockdep_is_held(&devdata_spinlock));
        RCU_INIT_POINTER(devdata, NULL);
-       spin_unlock_irqrestore(&devdata_mutex, flags);
+       spin_unlock_irqrestore(&devdata_spinlock, flags);
        synchronize_rcu();
        if (old_devdata && old_devdata->dev)
                dev_set_drvdata(old_devdata->dev, NULL);
--
2.47.0


