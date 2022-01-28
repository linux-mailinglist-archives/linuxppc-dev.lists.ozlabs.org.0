Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6294D49FCC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 16:26:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlhBj1zSZz3bsp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 02:26:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O66WXT1P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jlh9z6JBwz2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 02:25:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O66WXT1P; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Jlh9x4K48z4xcS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 02:25:57 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Jlh9x4Gnzz4xcT; Sat, 29 Jan 2022 02:25:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=O66WXT1P; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Jlh9w5rcLz4xcS
 for <linuxppc-dev@ozlabs.org>; Sat, 29 Jan 2022 02:25:56 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SFDr8b016419
 for <linuxppc-dev@ozlabs.org>; Fri, 28 Jan 2022 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=oV59mwBS7uLINR8s9L7VUsjZ2ZwCpOmCIR7/TmmmpYA=;
 b=O66WXT1PgqhgVXsOg/s1OeA2vva0FIVPbWNRmrPr2Dq1HxtpKsBYayep48nS3JGL4rMh
 jrl7f9DkEk+m7k6pLFW4Kcf8Di/OsxHNBkqV9CBjza6x9bB2ObLA6Zr+GVopP94NRvs9
 Fp+4lKWJrheV5yTYpCp5ubSTVo8v3b9ygOS1omnPr4EprcD39b8zUGpEoZZ63fbvFJFb
 TdE5m+LmYhG3LMgy40X6MvoYiIqKG9eIMeWp8Mu1/D2Rg0dhuP07qwTRNvJFKcRQUVUr
 Nfk7AGqVQva9DxwIxoBx3wn07zcIye/OMFs+uKPbvBgl+C58itq05eOUt3vO1r4BPmAe sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvd757fkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 28 Jan 2022 15:25:53 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SFF1IM022781
 for <linuxppc-dev@ozlabs.org>; Fri, 28 Jan 2022 15:25:53 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvd757fjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 15:25:52 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SEwfDp001766;
 Fri, 28 Jan 2022 15:07:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3dr96k890c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 15:07:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20SEvOQ132440598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 14:57:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E85114C040;
 Fri, 28 Jan 2022 15:07:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D6094C050;
 Fri, 28 Jan 2022 15:07:02 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.30.55])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 28 Jan 2022 15:07:02 +0000 (GMT)
Date: Fri, 28 Jan 2022 20:36:59 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v3] PCI hotplug: rpaphp: Error out on busy status from
 get-sensor-state
Message-ID: <20220128150659.noid5h5p53m6gxpm@in.ibm.com>
References: <163853708110.360679.18375283379078566258.stgit@jupiter>
 <87y24tn7ms.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y24tn7ms.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BTL2Dgl-aTmvI4OmkpERNumEbIAhU9WQ
X-Proofpoint-GUID: 9iCdZOuf1aZnWDOWsy8nG-0yCjgUZGAu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_04,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1011
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201280095
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
Reply-To: mahesh@linux.ibm.com
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-12-09 09:02:51 Thu, Nathan Lynch wrote:
> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> > To avoid this issue, fix the pci hotplug driver (rpaphp) to return an error
> > if the slot presence state can not be detected immediately. Current
> > implementation uses rtas_get_sensor() API which blocks the slot check state
> > until rtas call returns success. Change rpaphp_get_sensor_state() to invoke
> > rtas_call(get-sensor-state) directly and take actions based on rtas return
> > status. This patch now errors out immediately on busy return status from
> > rtas_call.
> >
> > Please note that, only on certain PHB failures, the slot presence check
> > returns BUSY condition. In normal cases it returns immediately with a
> > correct presence state value. Hence this change has no impact on normal pci
> > dlpar operations.
> 
> I was wondering about this. This seems to be saying -2/990x cannot
> happen in other cases. I couldn't find this specified in the
> architecture. It seems a bit risky to me to *always* error out on
> -2/990x - won't we have intermittent slot enable failures?

Sorry for the late response. So instead of always returning error out
how about we error out only if pe is going through EEH recovery ? During
get_adapter_status I can check if pe->state is set to EEH_PE_RECOVERING
and only then return error on busy else fallback to existing method of
rtas_get_sensor. Let me send out another version with this approach.

Thanks,
-Mahesh.

> 
> > +/*
> > + * RTAS call get-sensor-state(DR_ENTITY_SENSE) return values as per PAPR:
> > + *    -1: Hardware Error
> > + *    -2: RTAS_BUSY
> > + *    -3: Invalid sensor. RTAS Parameter Error.
> > + * -9000: Need DR entity to be powered up and unisolated before RTAS call
> > + * -9001: Need DR entity to be powered up, but not unisolated, before RTAS call
> > + * -9002: DR entity unusable
> > + *  990x: Extended delay - where x is a number in the range of 0-5
> > + */
> > +#define RTAS_HARDWARE_ERROR	-1
> > +#define RTAS_INVALID_SENSOR	-3
> > +#define SLOT_UNISOLATED		-9000
> > +#define SLOT_NOT_UNISOLATED	-9001
> > +#define SLOT_NOT_USABLE		-9002
> > +
> > +static int rtas_to_errno(int rtas_rc)
> > +{
> > +	int rc;
> > +
> > +	switch (rtas_rc) {
> > +	case RTAS_HARDWARE_ERROR:
> > +		rc = -EIO;
> > +		break;
> > +	case RTAS_INVALID_SENSOR:
> > +		rc = -EINVAL;
> > +		break;
> > +	case SLOT_UNISOLATED:
> > +	case SLOT_NOT_UNISOLATED:
> > +		rc = -EFAULT;
> > +		break;
> > +	case SLOT_NOT_USABLE:
> > +		rc = -ENODEV;
> > +		break;
> > +	case RTAS_BUSY:
> > +	case RTAS_EXTENDED_DELAY_MIN...RTAS_EXTENDED_DELAY_MAX:
> > +		rc = -EBUSY;
> > +		break;
> > +	default:
> > +		err("%s: unexpected RTAS error %d\n", __func__, rtas_rc);
> > +		rc = -ERANGE;
> > +		break;
> > +	}
> > +	return rc;
> > +}
> 
> These conversions look OK to me.

-- 
Mahesh J Salgaonkar
