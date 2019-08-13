Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A34BD8BBA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 16:37:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Fff0Fs2zDqPW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 00:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Fbf6Mw5zDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 00:34:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467Fbf0LKKz8tTT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 00:34:38 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467Fbd5Yqdz9sNf; Wed, 14 Aug 2019 00:34:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 467Fbc51Byz9sND
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 00:34:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DEYKEo055398
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 10:34:33 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uby3980hn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 10:34:32 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Tue, 13 Aug 2019 15:34:29 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 13 Aug 2019 15:34:27 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7DEYMdH47120634
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 14:34:22 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F8A7AE055;
 Tue, 13 Aug 2019 14:34:22 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABEE2AE051;
 Tue, 13 Aug 2019 14:34:20 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.37.181])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Aug 2019 14:34:20 +0000 (GMT)
Date: Tue, 13 Aug 2019 20:04:13 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 12/25] powernv/fadump: define register/un-register
 callback functions
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327680307.27462.16414477591782848444.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327680307.27462.16414477591782848444.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081314-0012-0000-0000-0000033E3205
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081314-0013-0000-0000-0000217841D4
Message-Id: <20190813143413.lzhpqbx43d4nefpa@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130155
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-16 17:03:23 Tue, Hari Bathini wrote:
> Make OPAL calls to register and un-register with firmware for MPIPL.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-fadump.c |   71 +++++++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 2 deletions(-)
> 
[...]
> @@ -88,12 +104,63 @@ static int opal_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
>  
>  static int opal_fadump_register_fadump(struct fw_dump *fadump_conf)
>  {
> -	return -EIO;
> +	int i, err = -EIO;
> +	s64 rc;
> +
> +	for (i = 0; i < opal_fdm->region_cnt; i++) {
> +		rc = opal_mpipl_update(OPAL_MPIPL_ADD_RANGE,
> +				       opal_fdm->rgn[i].src,
> +				       opal_fdm->rgn[i].dest,
> +				       opal_fdm->rgn[i].size);
> +		if (rc != OPAL_SUCCESS)

You may want to remove ranges which has been added so far on error and reset
opal_fdm->registered_regions.

> +			break;
> +
> +		opal_fdm->registered_regions++;
> +	}
> +
> +	switch (rc) {
> +	case OPAL_SUCCESS:
> +		pr_info("Registration is successful!\n");
> +		fadump_conf->dump_registered = 1;
> +		err = 0;
> +		break;
> +	case OPAL_UNSUPPORTED:
> +		pr_err("Support not available.\n");
> +		fadump_conf->fadump_supported = 0;
> +		fadump_conf->fadump_enabled = 0;
> +		break;
> +	case OPAL_INTERNAL_ERROR:
> +		pr_err("Failed to register. Hardware Error(%lld).\n", rc);
> +		break;
> +	case OPAL_PARAMETER:
> +		pr_err("Failed to register. Parameter Error(%lld).\n", rc);
> +		break;
> +	case OPAL_PERMISSION:

You may want to remove this check. With latest opal mpipl patches
opal_mpipl_update() no more returns OPAL_PERMISSION.

Even if opal does, we can not say fadump already registered just by
looking at return status of single entry addition.

Thanks,
-Mahesh.

> +		pr_err("Already registered!\n");
> +		fadump_conf->dump_registered = 1;
> +		err = -EEXIST;
> +		break;
> +	default:
> +		pr_err("Failed to register. Unknown Error(%lld).\n", rc);
> +		break;
> +	}
> +
> +	return err;
>  }

