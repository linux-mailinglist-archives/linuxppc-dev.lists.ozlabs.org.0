Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11939323E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 17:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrWd90KmHz308y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 01:17:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=COG/l0eF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=dan.carpenter@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=COG/l0eF; 
 dkim-atps=neutral
X-Greylist: delayed 2240 seconds by postgrey-1.36 at boromir;
 Fri, 28 May 2021 01:16:34 AEST
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrWcf0cdjz2xvN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 01:16:33 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14REZINU091897;
 Thu, 27 May 2021 14:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=2cWNSzPHxT4+TtO20cktydNM136a4XNJfF9qm2ldDgc=;
 b=COG/l0eFrIGy2v8yfYCjPo096ZmT871QOihIxtXKWxdX/gRd2i64dkO9nJR9mFsFcg8s
 3d+wIDdy60rKaLYivKQpZPfVzToBYwUnV9vAVW/pcIyHdLiAaVgsi9Tu2onm4ZFfp54w
 joeJwhrG6Fwb/1rf4pDvTdhkcGQ9RsDP692VcxB62fISCWEaAg3BMGUSqkN0ZnTHNiec
 UnOo8ZapdzcIPJFw5rBK/0kdw1QF/1LSdXdflbdWDpDM28s/pv52J23rsgzrFEPPFqHD
 7QxtJIdiBoTY9vGbkbOzZGabxFxQ4Yl2Kd0Oh+0S40V99J/6uxTA0OyyOm+am9CAIJcD Fg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 38pqfcmea7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14REaAXE101211;
 Thu, 27 May 2021 14:37:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38pr0dn4mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:54 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14REbrPF103775;
 Thu, 27 May 2021 14:37:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38pr0dn4mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:53 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14REbqlO103757;
 Thu, 27 May 2021 14:37:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38pr0dn4m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:52 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14REbffR028351;
 Thu, 27 May 2021 14:37:41 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 27 May 2021 14:37:40 +0000
Date: Thu, 27 May 2021 17:37:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Message-ID: <20210527143729.GL24442@kadam>
References: <20210526092020.554341-1-chenhuang5@huawei.com>
 <20210526092020.554341-2-chenhuang5@huawei.com>
 <0f03f9b9ff41460db2935e077f7f80c7@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f03f9b9ff41460db2935e077f7f80c7@AcuMS.aculab.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: xI1PN-Oc27c8aWvBSQ4m3wXmnwlPjzpN
X-Proofpoint-GUID: xI1PN-Oc27c8aWvBSQ4m3wXmnwlPjzpN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9996
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105270095
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nathan Lynch <nathanl@linux.ibm.com>, Jens Axboe <axboe@kernel.dk>,
 Andrew Donnellan <ajd@linux.ibm.com>, 'Chen Huang' <chenhuang5@huawei.com>,
 Joel Becker <jlbec@evilplan.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 27, 2021 at 02:10:21PM +0000, David Laight wrote:
> From: Chen Huang
> > Sent: 26 May 2021 10:20
> > 
> > The simple_strtoull() function is deprecated in some situation, since
> > it does not check for the range overflow, use kstrtoull() instead.
> > 
> ...
> > -	target_bytes = simple_strtoull(buf, &endchar, 0) * 1024;
> > +	ret = kstrtoull(buf, 0, &target_bytes);
> > +	if (ret)
> > +		return ret;
> > +	target_bytes *= 1024;
> 
> I'd have thought it was more important to check *endchar
> than overflow.

That's one of the differences between simple_strtoull() and kstrtoull().
The simple_strtoull() will accept a string like "123ABC", but kstrtoull()
will only accept NUL terminated numbers or a newline followed by a NUL
terminator.  Which is fine in this context because users will be doing
"echo 1234 > /sys/foo".

> If you are worried about overflow you need a range check
> before the multiply.

This is probably a case where if the users cause an integer overflow
then they get what they deserve.

regards,
dan carpenter
