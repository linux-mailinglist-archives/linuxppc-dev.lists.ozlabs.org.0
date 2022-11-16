Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE5962CE9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 00:17:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCJqY67tFz3dvJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 10:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pgx35/or;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pgx35/or;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCJpY6mw9z3cJX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 10:16:53 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AGN4b6d017900;
	Wed, 16 Nov 2022 23:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=RbDAiw4mR9OgYWByLQm1coMXC3xW/DqD1ayeJLp5/Uw=;
 b=pgx35/orgdJq38D5TELt20UBRpEkb5kHXmGzVSjtwvETSLl+kye+P7XJmdZx+DDEFLTC
 MYVhE1O0ztneXFEVpp7qI1d/cZGEcD2TY4CK+vl3nqMbgV99+96u2a49cn9Qn5hgXbgw
 MzugbftfSuad2ZnomLZwCedcZTvEnRAXbJAYdBhKk7aVgiVl6tMS+vj7CTDqdNrPd0MY
 L/atb8Idlih0b63crKblmLY+p0q0SLmwLYDS6sbBBMcUTuMjwMmuyFz/vPWcqglkVfzJ
 NP4k/vOY0JGjKCfxKQpRjH1RxTjsvcSlwbSQxm+/kKaxhs2OwGQSAwZ+lDLwZyKOyoTB OA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw97h07se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 23:16:39 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGNGc03030755;
	Wed, 16 Nov 2022 23:16:39 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw97h07s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 23:16:38 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGN5RZv004528;
	Wed, 16 Nov 2022 23:16:38 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma02dal.us.ibm.com with ESMTP id 3kt34a4uxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Nov 2022 23:16:38 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AGNGcRx35521266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Nov 2022 23:16:38 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A3AB5805D;
	Wed, 16 Nov 2022 23:16:36 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67E105804C;
	Wed, 16 Nov 2022 23:16:35 +0000 (GMT)
Received: from sig-9-65-207-159.ibm.com (unknown [9.65.207.159])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Nov 2022 23:16:35 +0000 (GMT)
Message-ID: <c13702d0d79628f0cece42e842bf2cc704bd0821.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 3/3] block: sed-opal: keystore access for SED Opal
 keys
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Jonathan Derrick <jonathan.derrick@linux.dev>, linux-block@vger.kernel.org
Date: Wed, 16 Nov 2022 17:16:34 -0600
In-Reply-To: <9b68f825-675c-ff78-cd83-fb4f9428940b@linux.dev>
References: <20220819223138.1457091-1-gjoyce@linux.vnet.ibm.com>
	 <20220819223138.1457091-4-gjoyce@linux.vnet.ibm.com>
	 <9b68f825-675c-ff78-cd83-fb4f9428940b@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tkd7vCQpT5_30aoc4oG5-KuxGqxOvoto
X-Proofpoint-GUID: 6tu25jHSWztGnQwHMyaP0m9Tmw_Ptz07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160157
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, nayna@linux.ibm.com, dhowells@redhat.com, jarkko@kernel.org, keyrings@vger.kernel.org, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-07 at 12:21 -0600, Jonathan Derrick wrote:
> LGTM besides comment below
> 
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> 
> On 8/19/2022 4:31 PM, gjoyce@linux.vnet.ibm.com wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Allow for permanent SED authentication keys by
> > reading/writing to the SED Opal non-volatile keystore.
> > 
> > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > ---
> >  block/sed-opal.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/block/sed-opal.c b/block/sed-opal.c
> > index 3bdb31cf3e7c..11b0eb3a656b 100644
> > --- a/block/sed-opal.c
> > +++ b/block/sed-opal.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/uaccess.h>
> >  #include <uapi/linux/sed-opal.h>
> >  #include <linux/sed-opal.h>
> > +#include <linux/sed-opal-key.h>
> >  #include <linux/string.h>
> >  #include <linux/kdev_t.h>
> >  #include <linux/key.h>
> > @@ -2697,7 +2698,13 @@ static int opal_set_new_pw(struct opal_dev
> > *dev, struct opal_new_pw *opal_pw)
> >  	if (ret)
> >  		return ret;
> >  
> > -	/* update keyring with new password */
> > +	/* update keyring and arch var with new password */
> > +	ret = sed_write_key(OPAL_AUTH_KEY,
> > +			    opal_pw->new_user_pw.opal_key.key,
> > +			    opal_pw->new_user_pw.opal_key.key_len);
> > +	if (ret != -EOPNOTSUPP)
> > +		pr_warn("error updating SED key: %d\n", ret);
> I cant see any reason this would fail and make the keys inconsistent,
> but it seems
> like update_sed_opal_key() should be dependent on sed_write_key()
> succeeding

The thought was that since the key was already updated on the SED
drive, there should be an attempt to update it in the key store
even in the unlikely event the keyring update failed.

> 
> > +
> >  	ret = update_sed_opal_key(OPAL_AUTH_KEY,
> >  				  opal_pw->new_user_pw.opal_key.key,
> >  				  opal_pw-
> > >new_user_pw.opal_key.key_len);
> > @@ -2920,6 +2927,8 @@ EXPORT_SYMBOL_GPL(sed_ioctl);
> >  static int __init sed_opal_init(void)
> >  {
> >  	struct key *kr;
> > +	char init_sed_key[OPAL_KEY_MAX];
> > +	int keylen = OPAL_KEY_MAX;
> >  
> >  	kr = keyring_alloc(".sed_opal",
> >  			   GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
> > current_cred(),
> > @@ -2932,6 +2941,11 @@ static int __init sed_opal_init(void)
> >  
> >  	sed_opal_keyring = kr;
> >  
> > -	return 0;
> > +	if (sed_read_key(OPAL_AUTH_KEY, init_sed_key, &keylen) < 0) {
> > +		memset(init_sed_key, '\0', sizeof(init_sed_key));
> > +		keylen = OPAL_KEY_MAX;
> > +	}
> > +
> > +	return update_sed_opal_key(OPAL_AUTH_KEY, init_sed_key,
> > keylen);
> >  }
> >  late_initcall(sed_opal_init);

