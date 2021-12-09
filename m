Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF046EA8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 16:03:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8y3J0WT3z3c7y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 02:03:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nnwFKQhQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8y2Z0VPsz2yfd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 02:03:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nnwFKQhQ; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J8y2X4vmyz4xd3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 02:03:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J8y2X4lRkz4xhd; Fri, 10 Dec 2021 02:03:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nnwFKQhQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J8y2X2Rl7z4xd3
 for <linuxppc-dev@ozlabs.org>; Fri, 10 Dec 2021 02:02:59 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9EvXQw016998
 for <linuxppc-dev@ozlabs.org>; Thu, 9 Dec 2021 15:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=8LLIeyYxU1bsP1waQ1kX6i/gs2ml6LM4+0zXFRtCe5Q=;
 b=nnwFKQhQUrfGkNSzoGaSzoRlUSmwvz5f4mE0xyVi3fOUmRGJHOjBOwyF1jBxkpGfPqpE
 rWk8nLa+jDNaeezEnJrvBdj3GU/HQn6lhLQ0qODSS5qONGdHWIDvjQxuMVoaXtbfXVWb
 rSWG6Wz9s15JwJLxXDWMuxzcqAmuNz8rGYdWCgjJDsxk6xr53SkEDXwG2gwPGB7q1alx
 +FP/r5aFc7j/m2OtNQB41le8OsGxTbhVTtRgWpTT+RoYe4mwASLjjSDMtpxgUg8DozC1
 Ba+xSSxOeypKKaVPYYUXiNdMOZ00bV+uoA1PMxf6flYMsJQAutF6FLpj3yoAQFxyr1MQ fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cum14g605-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 09 Dec 2021 15:02:56 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B9EwQF7023547
 for <linuxppc-dev@ozlabs.org>; Thu, 9 Dec 2021 15:02:56 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cum14g5yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:02:56 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9F2E5C025090;
 Thu, 9 Dec 2021 15:02:55 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 3cqyyc9pdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:02:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9F2rDX27394424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 15:02:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49A71124058;
 Thu,  9 Dec 2021 15:02:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3146124054;
 Thu,  9 Dec 2021 15:02:52 +0000 (GMT)
Received: from localhost (unknown [9.211.99.77])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 15:02:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v3] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
In-Reply-To: <163853708110.360679.18375283379078566258.stgit@jupiter>
References: <163853708110.360679.18375283379078566258.stgit@jupiter>
Date: Thu, 09 Dec 2021 09:02:51 -0600
Message-ID: <87y24tn7ms.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TyZUF3FsLg4kGmcmc7BqOdZffw-T8DoL
X-Proofpoint-ORIG-GUID: jo_UFsqymoQ4TyACVfCWPxwpWFa888AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_06,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090082
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> To avoid this issue, fix the pci hotplug driver (rpaphp) to return an error
> if the slot presence state can not be detected immediately. Current
> implementation uses rtas_get_sensor() API which blocks the slot check state
> until rtas call returns success. Change rpaphp_get_sensor_state() to invoke
> rtas_call(get-sensor-state) directly and take actions based on rtas return
> status. This patch now errors out immediately on busy return status from
> rtas_call.
>
> Please note that, only on certain PHB failures, the slot presence check
> returns BUSY condition. In normal cases it returns immediately with a
> correct presence state value. Hence this change has no impact on normal pci
> dlpar operations.

I was wondering about this. This seems to be saying -2/990x cannot
happen in other cases. I couldn't find this specified in the
architecture. It seems a bit risky to me to *always* error out on
-2/990x - won't we have intermittent slot enable failures?

> +/*
> + * RTAS call get-sensor-state(DR_ENTITY_SENSE) return values as per PAPR:
> + *    -1: Hardware Error
> + *    -2: RTAS_BUSY
> + *    -3: Invalid sensor. RTAS Parameter Error.
> + * -9000: Need DR entity to be powered up and unisolated before RTAS call
> + * -9001: Need DR entity to be powered up, but not unisolated, before RTAS call
> + * -9002: DR entity unusable
> + *  990x: Extended delay - where x is a number in the range of 0-5
> + */
> +#define RTAS_HARDWARE_ERROR	-1
> +#define RTAS_INVALID_SENSOR	-3
> +#define SLOT_UNISOLATED		-9000
> +#define SLOT_NOT_UNISOLATED	-9001
> +#define SLOT_NOT_USABLE		-9002
> +
> +static int rtas_to_errno(int rtas_rc)
> +{
> +	int rc;
> +
> +	switch (rtas_rc) {
> +	case RTAS_HARDWARE_ERROR:
> +		rc = -EIO;
> +		break;
> +	case RTAS_INVALID_SENSOR:
> +		rc = -EINVAL;
> +		break;
> +	case SLOT_UNISOLATED:
> +	case SLOT_NOT_UNISOLATED:
> +		rc = -EFAULT;
> +		break;
> +	case SLOT_NOT_USABLE:
> +		rc = -ENODEV;
> +		break;
> +	case RTAS_BUSY:
> +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> +		rc = -EBUSY;
> +		break;
> +	default:
> +		err("%s: unexpected RTAS error %d\n", __func__, rtas_rc);
> +		rc = -ERANGE;
> +		break;
> +	}
> +	return rc;
> +}

These conversions look OK to me.
