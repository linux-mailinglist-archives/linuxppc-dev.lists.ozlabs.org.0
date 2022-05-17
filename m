Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC0C52A44A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 16:07:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2dH01yx3z3cDX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 00:07:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dI2gVmi4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dI2gVmi4; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2dGF0N3Gz3bnr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 00:06:44 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HDv79q031385;
 Tue, 17 May 2022 14:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=RQpuJV7Fl07kSdTKKiK3KqeU5dPaT+/n+ofBgmntp2M=;
 b=dI2gVmi4Wn4pfK7AWBGOQwS0Ak8hubl9RmtT74i8bNxERQu7aS5sW+wXsFPHSbYUZe93
 bc9SVSy79+bCt/tCTNApzneBUY8YqftV6MtQG8YAaDuu3vDkWvi+5Fr4I8b6bmQm2/Hn
 idP2oRoUVXWNdFV7mR6R4G39zkeRy6AgV8S4LtdTm82ql4Ug0qzThYIF9+VrMABRsTZg
 TCkoZQ8t2d6FtOcT1APL2tt4g0DDdPUesf3c+ny5ESGnvFOyjIKvCBIHVEoGttwYwMqd
 DbKm+AqSpAnVgNrhIj+UonaCsV3dhTjmpMiBIRtCfG6DpynqVaXOZe4m8W7bNvoHYzie Sg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4d1t07f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 14:06:37 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24HDvmHs016778;
 Tue, 17 May 2022 14:06:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3g2428uf80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 14:06:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24HE6WGF43188548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 14:06:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 238B642047;
 Tue, 17 May 2022 14:06:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E5924203F;
 Tue, 17 May 2022 14:06:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.163.5.59])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 17 May 2022 14:06:28 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 2/2] powerpc/perf: Fix the threshold compare group
 constraint for power9
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220506061015.43916-2-kjain@linux.ibm.com>
Date: Tue, 17 May 2022 19:36:24 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E9D3C37-F4FB-4480-B007-49E1ABD0A36D@linux.vnet.ibm.com>
References: <20220506061015.43916-1-kjain@linux.ibm.com>
 <20220506061015.43916-2-kjain@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DcY6Cm88DgH1KVyWvr_4O5j0L4yQMHC4
X-Proofpoint-GUID: DcY6Cm88DgH1KVyWvr_4O5j0L4yQMHC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205170087
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 disgoel@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-May-2022, at 11:40 AM, Kajol Jain <kjain@linux.ibm.com> wrote:
>=20
> Thresh compare bits for a event is used to program thresh compare
> field in Monitor Mode Control Register A (MMCRA: 9-18 bits for =
power9).
> When scheduling events as a group, all events in that group should
> match value in threshold bits (like thresh compare, thresh control,
> thresh select). Otherwise event open for the sibling events should =
fail.
> But in the current code, incase thresh compare bits are not valid,
> we are not failing in group_constraint function which can result
> in invalid group schduling.
>=20
> Fix the issue by returning -1 incase event is threshold and threshold
> compare value is not valid.
>=20
> Thresh control bits in the event code is used to program thresh_ctl
> field in Monitor Mode Control Register A (MMCRA: 48-55). In below =
example,
> the scheduling of group events PM_MRK_INST_CMPL (873534401e0) and
> PM_THRESH_MET (8734340101ec) is expected to fail as both event
> request different thresh control bits and invalid thresh compare =
value.
>=20
> Result before the patch changes:
>=20
> [command]# perf stat -e "{r8735340401e0,r8734340101ec}" sleep 1
>=20
> Performance counter stats for 'sleep 1':
>=20
>            11,048      r8735340401e0
>             1,967      r8734340101ec
>=20
>       1.001354036 seconds time elapsed
>=20
>       0.001421000 seconds user
>       0.000000000 seconds sys
>=20
> Result after the patch changes:
>=20
> [command]# perf stat -e "{r8735340401e0,r8734340101ec}" sleep 1
> Error:
> The sys_perf_event_open() syscall returned with 22 (Invalid argument)
> for event (r8735340401e0).
> /bin/dmesg | grep -i perf may provide additional information.
>=20
> Fixes: 78a16d9fc1206 ("powerpc/perf: Avoid FAB_*_MATCH checks for =
power9")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> ---
> arch/powerpc/perf/isa207-common.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/perf/isa207-common.c =
b/arch/powerpc/perf/isa207-common.c
> index 013b06af6fe6..bb5d64862bc9 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -508,7 +508,8 @@ int isa207_get_constraint(u64 event, unsigned long =
*maskp, unsigned long *valp,
> 		if (event_is_threshold(event) && =
is_thresh_cmp_valid(event)) {
> 			mask  |=3D CNST_THRESH_MASK;
> 			value |=3D CNST_THRESH_VAL(event >> =
EVENT_THRESH_SHIFT);
> -		}
> +		} else if (event_is_threshold(event))
> +			return -1;
> 	} else {
> 		/*
> 		 * Special case for PM_MRK_FAB_RSP_MATCH and =
PM_MRK_FAB_RSP_MATCH_CYC,
> --=20
> 2.31.1
>=20

