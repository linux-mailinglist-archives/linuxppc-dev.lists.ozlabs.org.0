Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732646C160
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 18:08:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7mwS27Yvz308v
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 04:08:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J1j/s5gi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J1j/s5gi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7mvg2ddXz2ymv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 04:07:58 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7FrHrj027785; 
 Tue, 7 Dec 2021 17:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KV7oBdrURQGDIkQQgRY7Ef5rSkRnP4z8E1pnB7i6FNg=;
 b=J1j/s5girdbYsJ7K6XED6vEV5veo7zOI4Z4X+M1t5GWoz+aJJJz3juezq7GQww0g6pKz
 +WqEy59fXYK0gnlGX+NwrBZOJ7ZO2ruKb7+0/iIqxLOFvPkglpqUp8CHLy7P+3stFLg3
 mPczk62fMabU1eBM5Oh70nSIHkO+Ns8SsaTu4EjKjl4MyiTia1T3JmIbXJm9GH9Pc5d+
 4+I50zqZGgHeiMM7Vj9+3MfZHBh+Ht365fGkZSrzkVj+KxtQuYw5r5Nz3th4vRlMMIjP
 iL01eS+GcEJt/LZandgeKjmncJoyjDhJwOdUM+OurpFN/DgqMdN9JO2Pw9uwdGEMw7O3 zA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctanb1q35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 17:07:55 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7H7qxR030589;
 Tue, 7 Dec 2021 17:07:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3cqyyagjd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 17:07:54 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7H7rUn50921938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 17:07:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEDEDB2068;
 Tue,  7 Dec 2021 17:07:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 911C8B2070;
 Tue,  7 Dec 2021 17:07:51 +0000 (GMT)
Received: from localhost (unknown [9.211.135.78])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 17:07:50 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <bbaa0d78-a09f-3ce3-25a9-67434039b741@linux.ibm.com>
References: <20211203154321.13168-1-ldufour@linux.ibm.com>
 <87bl1so588.fsf@linux.ibm.com>
 <bbaa0d78-a09f-3ce3-25a9-67434039b741@linux.ibm.com>
Date: Tue, 07 Dec 2021 11:07:50 -0600
Message-ID: <878rwwny1l.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u4OqYHRlQ7DzTIQDdbgq-sLH52StFeJr
X-Proofpoint-ORIG-GUID: u4OqYHRlQ7DzTIQDdbgq-sLH52StFeJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_06,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070106
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> On 07/12/2021, 15:32:39, Nathan Lynch wrote:
>> Is there a reasonable fallback for VMs where this parameter doesn't
>> exist? PowerVM partitions should always have it, but what do we want the
>> behavior to be on other hypervisors?
>
> In that case, there is no value displayed in the /proc/powerpc/lparcfg and
> the lparstat -i command will fall back to the device tree value. I can't
> see any valid reason to report the value defined in the device tree
> here.

Here's a valid reason :-)

lparstat isn't the only possible consumer of the interface, and the
'ibm,partition-name' property and the dynamic system parameter clearly
serve a common purpose. 'ibm,partition-name' is provided by qemu.

In any case, the function should not print an error when the return
value is -3 (parameter not supported).
