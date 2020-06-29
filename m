Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5166920CC89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 06:33:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wF3Z4vcmzDqWm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 14:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wF1w1RmYzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 14:31:47 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05T4VGv2165451; Mon, 29 Jun 2020 00:31:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31x23w3fan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 00:31:41 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05T4VMXl165960;
 Mon, 29 Jun 2020 00:31:40 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31x23w3fa3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 00:31:40 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05T4QNef031116;
 Mon, 29 Jun 2020 04:31:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgrvk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 04:31:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05T4Vapu56754536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 04:31:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67B6452052;
 Mon, 29 Jun 2020 04:31:36 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.73.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 05A0C5205A;
 Mon, 29 Jun 2020 04:31:33 +0000 (GMT)
Date: Mon, 29 Jun 2020 10:01:30 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/mm: Enable radix GTSE only if supported.
Message-ID: <20200629043130.GD27215@in.ibm.com>
References: <20200626131000.5207-1-bharata@linux.ibm.com>
 <20200626131000.5207-2-bharata@linux.ibm.com>
 <20200626205530.GA23269@kermit.br.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200626205530.GA23269@kermit.br.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-29_04:2020-06-26,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 bulkscore=0 cotscore=-2147483648 mlxlogscore=999 spamscore=0 adultscore=0
 suspectscore=1 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006290027
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
Reply-To: bharata@linux.ibm.com
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 05:55:30PM -0300, Murilo Opsfelder Araújo wrote:
> > diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> > index bc73abf0bc25..152aa0200cef 100644
> > --- a/arch/powerpc/mm/init_64.c
> > +++ b/arch/powerpc/mm/init_64.c
> > @@ -407,12 +407,15 @@ static void __init early_check_vec5(void)
> >  		if (!(vec5[OV5_INDX(OV5_RADIX_GTSE)] &
> >  						OV5_FEAT(OV5_RADIX_GTSE))) {
> >  			pr_warn("WARNING: Hypervisor doesn't support RADIX with GTSE\n");
> > -		}
> > +			cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
> > +		} else
> > +			cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
> >  		/* Do radix anyway - the hypervisor said we had to */
> >  		cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
> >  	} else if (mmu_supported == OV5_FEAT(OV5_MMU_HASH)) {
> >  		/* Hypervisor only supports hash - disable radix */
> >  		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
> > +		cur_cpu_spec->mmu_features &= ~MMU_FTR_GTSE;
> >  	}
> >  }
> 
> Is this a part of the code where mmu_clear_feature() cannot be used?

Yes, it appears so. Jump label initialization isn't done yet.

Regards,
Bharata.
