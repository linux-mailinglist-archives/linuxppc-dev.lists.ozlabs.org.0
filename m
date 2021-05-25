Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80439056E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 17:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqHzd4RWjz305x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 01:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TUGin3ye;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TUGin3ye; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqHz55Bk6z2y6B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 01:28:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PF45UT176463; Tue, 25 May 2021 11:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WvPJCjPBzzqyGIhh7fMQZ9p+hJHLv+hItbW/FNQLCuE=;
 b=TUGin3yePZ63bqeZa5Cc7V32lBhIaTUmKDITPgI2nhyhjrtxQZxrDPjPZ+cTUn5XMOoW
 gId04m02Pntoo6NLOs7ustfWoVAMwKG198Zsa4Hyuk9zNnFZI8BxkKSyrLHmfW78Snor
 lha1FFHQfn6BD02cr93Wu6MfiIZdH7UsesJIG10er3FBLpWiJBvAIPhdnKXOMtGSey1d
 14ifHSfgeQsFdap7Hxovm//YSTxPhWxzVDHK4eFiQ0RxhbBkVgkpbKe8hhZY7lhf45i9
 B8BTdYJvXQnSqlYQE4STYL3yy75f7/jv7YM7IjFkEN5P1/k/WEcy/6EENHRnuvMeEo54 sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s2xvafcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 11:28:08 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14PF44Pt176403;
 Tue, 25 May 2021 11:28:07 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38s2xvafby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 11:28:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14PFRv25001772;
 Tue, 25 May 2021 15:28:07 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 38s1qd14n8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 15:28:07 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PFS5qu25755988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 15:28:05 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA2E1136051;
 Tue, 25 May 2021 15:28:05 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26646136063;
 Tue, 25 May 2021 15:28:04 +0000 (GMT)
Received: from li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com (unknown
 [9.85.178.250])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 25 May 2021 15:28:03 +0000 (GMT)
Date: Tue, 25 May 2021 10:27:36 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>, Nageswara Sastry <rnsastry@linux.ibm.com>
Subject: Re: [PATCH] perf vendor events: Fix eventcode of power10 json events
Message-ID: <20210525152736.GB2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
References: <20210525063723.1191514-1-kjain@linux.ibm.com>
 <20210525144215.GA2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525144215.GA2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9btOxma5TmTIucKhsFdjQlylT8J58Jgu
X-Proofpoint-GUID: GKiKfC2dpxACdk2dsSrBe12pbCCB2JJ9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_07:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250092
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 25, 2021 at 09:42:15AM -0500, Paul A. Clarke wrote:
> On Tue, May 25, 2021 at 12:07:23PM +0530, Kajol Jain wrote:
> > Fixed the eventcode values in the power10 json event files to append
> > "0x" since these are hexadecimal values.
> > Patch also changes event description of PM_EXEC_STALL_LOAD_FINISH and
> > PM_EXEC_STALL_NTC_FLUSH event and move some events to correct files.
> > 
> > Fixes: 32daa5d7899e ("perf vendor events: Initial JSON/events list for power10 platform")
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> I checked that everything that was "removed" was actually just moved
> somewhere else, that all the added EventCodes indeed had '0x', the
> number of EventCodes added matched the number removed, and that the
> additional text added seemed reasonable.  LGTM.
> 
> Reviewed-by: Paul A. Clarke <pc@us.ibm.com>

I lost the original message, but Nageswara Sastry said:
> 1. Extracted all the 244 events from the patch.
> 2. Check them in 'perf list' - all 244 events found
> 3. Ran all the events with 'perf stat -e "event name" sleep 1', all ran fine.
>     No errors were seen in 'dmesg'

I count 255 events.

PC
