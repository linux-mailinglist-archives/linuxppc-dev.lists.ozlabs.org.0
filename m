Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D77A62CF02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 00:45:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCKRV71RMz3cNY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 10:45:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C41DMRDD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C41DMRDD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCKQY21n1z3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 10:44:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGNgMTD018883;
	Wed, 16 Nov 2022 23:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=J1gnzsf/D1YTJY8T2+5NQLgeCtaYrxMGyExgYqnS8Wg=;
 b=C41DMRDD5aHvopRQA7Xc7BtxHDLvZO/6OXZMKnUQ5KQi1Bzz/OKsMo2qrglSffZOVCVr
 ZZgnR5EtEg8Q4yzOjiCcGH+iLlmRokr1+rs0HhRkgPQaimZaEsW2Uy9YAGb9KnmBnveh
 BPYtqLX1Hh2V/z4itIqhMME3k7H02jUyR5rmaSIz+djK6WB/zXsM3NLUDtNvkYgtOrsw
 3v3lxYlmZegfFX/39R+AVsGulYi0/VMSDQ1PF1/eJxzCenTEhKSoyHVf/pju6fdBJRkt
 rjPKTSHe90fhbVgNgV+qcpjCOvmEXVpFXHCZU+CGUKtMP+Pz7WfMZpU81xpPqhjOSTGe qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw9s7010n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 23:44:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGNgWF8019113;
	Wed, 16 Nov 2022 23:44:22 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw9s7010g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 23:44:22 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGNZJHV020230;
	Wed, 16 Nov 2022 23:44:22 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma03dal.us.ibm.com with ESMTP id 3kt34a4ymw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 23:44:22 +0000
Received: from smtpav02.dal12v.mail.ibm.com ([9.208.128.128])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AGNiK7941681590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Nov 2022 23:44:21 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6EC95805A;
	Wed, 16 Nov 2022 23:44:20 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5577858051;
	Wed, 16 Nov 2022 23:44:19 +0000 (GMT)
Received: from sig-9-65-207-159.ibm.com (unknown [9.65.207.159])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Nov 2022 23:44:19 +0000 (GMT)
Message-ID: <c24c0f7c81ff24d791974ff7945e710b489b7e01.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 2/3] powerpc/pseries: PLPKS SED Opal keystore support
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>,
        "linux-block@vger.kernel.org"
	 <linux-block@vger.kernel.org>
Date: Wed, 16 Nov 2022 17:44:18 -0600
In-Reply-To: <MW5PR84MB1842689FD13382CAFCC260D8AB5F9@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
References: <20220819223138.1457091-1-gjoyce@linux.vnet.ibm.com>
	 <20220819223138.1457091-3-gjoyce@linux.vnet.ibm.com>
	 <MW5PR84MB1842689FD13382CAFCC260D8AB5F9@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JgbknSy7aXhV73SxJYXrtnAvcD7UjiHr
X-Proofpoint-GUID: nGERouHv7XWg6rQBOqOkw7vipn-DPvyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160161
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: "axboe@kernel.dk" <axboe@kernel.dk>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "jarkko@kernel.org" <jarkko@kernel.org>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, "jonathan.derrick@linux.dev" <jonathan.derrick@linux.dev>, "brking@linux.vnet.ibm.com" <brking@linux.vnet.ibm.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "msuchanek@suse.de" <msuchanek@suse.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-07 at 19:09 +0000, Elliott, Robert (Servers) wrote:
> > -----Original Message-----
> > From: gjoyce@linux.vnet.ibm.com <gjoyce@linux.vnet.ibm.com>
> > Sent: Friday, August 19, 2022 5:32 PM
> > To: linux-block@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org; jonathan.derrick@linux.dev;
> > brking@linux.vnet.ibm.com; msuchanek@suse.de; mpe@ellerman.id.au;
> > nayna@linux.ibm.com; axboe@kernel.dk; akpm@linux-foundation.org;
> > gjoyce@linux.vnet.ibm.com; linux-efi@vger.kernel.org;
> > keyrings@vger.kernel.org; dhowells@redhat.com; jarkko@kernel.org
> > Subject: [PATCH v4 2/3] powerpc/pseries: PLPKS SED Opal keystore
> > support
> > 
> > +++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> ...
> > +struct plpks_sed_object_data {
> > +	u_char version;
> > +	u_char pad1[7];
> > +	u_long authority;
> > +	u_long range;
> > +	u_int  key_len;
> > +	u_char key[32];
> > +};
> ...
> > +/*
> > + * Read the SED Opal key from PLPKS given the label
> > + */
> > +int sed_read_key(char *keyname, char *key, u_int *keylen)
> > +{
> ...
> > +	*keylen = be32_to_cpu(data->key_len);
> > +
> > +	if (var.data) {
> > +		memcpy(key, var.data + offset, var.datalen - offset);
> > +		key[*keylen] = '\0';
> 
> Is there a guarantee that key_len is always < sizeof key, or
> does that need to be checked in more places?

Changed keylen paramter to be the maximum size that it copied. This 
will help avoid buffer overwrite.


