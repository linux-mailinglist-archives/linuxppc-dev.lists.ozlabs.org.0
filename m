Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8EF771985
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 07:41:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gO21QDVW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK4vP0nrgz30fV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 15:41:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gO21QDVW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK4tN2dhwz2yW3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 15:40:59 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3775UGTj011903;
	Mon, 7 Aug 2023 05:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=+5oBXYTr6RIxgwheo+ZAGVe1UjNjK6JGfJu/y0rYJaQ=;
 b=gO21QDVWyb6QjL6ag5f80EhnFXJKAJypYF1QCCRkT+2/E5Gu375fx8wQi1Di9s6ZaxSo
 Athi3lHoos+xVJodwR4NZBYTdkj+vOJ/Z3BopFhibWtOO2R8nW2NRfYb/BKIMCQXTTkS
 tlz+Q23jAwOcrMKZqC2Mj4m1XhRbOZNtND3dok1IwzKRNoTUiivHZ0x6mAilcP/Utk9O
 pKN2gjwbInoaaFIe74d91rCfv85bNfQqf3+V+v6CimwrIV6MsboLf0+VSACDVu3X6AQ0
 ZPWk/yp/SkVfJUOGHEfGFy2U+2Kuz8WwtjyeAu5IH3yq68q+liFm7tNhXTb6x/ogUKus ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sath90b2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 05:40:55 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3775UU2t012530;
	Mon, 7 Aug 2023 05:40:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sath90b1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 05:40:54 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3775C5LP001888;
	Mon, 7 Aug 2023 05:40:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa3f19sr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 05:40:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3775eoaN53019042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 05:40:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCE6620043;
	Mon,  7 Aug 2023 05:40:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6CB020040;
	Mon,  7 Aug 2023 05:40:48 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  7 Aug 2023 05:40:48 +0000 (GMT)
Date: Mon, 7 Aug 2023 11:10:46 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1] perf tests task_analyzer: Check perf build options
 for libtraceevent support
Message-ID: <gjdp7542qjhoohpgxnif3dhy4ozf3jy45migwg2phppy3yi6at@qyk7ncusvxhl>
References: <20230725061649.34937-1-adityag@linux.ibm.com>
 <ZMPWk5K63tadmDlU@kernel.org>
 <CAP-5=fW1zkpJ4zr4ngz=6bZQuE6hOHo4AtXwUsVJK9oiDSc_mg@mail.gmail.com>
 <ZMQJKmV3XtwtZJtO@kernel.org>
 <4qqzt2g2iuo2kri54jyr7tspfxfod4nzsuzajxk3butoxs2rww@rj4quuzpoeg3>
 <BD9DB9F2-B277-4CAC-8FA5-9B8F970A2F88@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BD9DB9F2-B277-4CAC-8FA5-9B8F970A2F88@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G6np9K8pV6QL02cBSMfQ9y3Vkg_mAmzB
X-Proofpoint-ORIG-GUID: uz2-LLUsettz_hu62_m09-oFZkGM-p0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_03,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=789 bulkscore=0 impostorscore=0
 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070050
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 03, 2023 at 12:52:50PM +0530, Athira Rajeev wrote:
> 
> 
> > On 03-Aug-2023, at 8:33 AM, Aditya Gupta <adityag@linux.ibm.com> wrote:
> > 
> > Hi Arnaldo,
> > I am working on a patch for 'perf version --has', and will send a patch next
> 
> Hi Aditya,
> 
> I believe, it will be “perf build —has” option. And not “perf version —has”  ?

Oh okay. I misread. Thanks for pointing it out Athira.

Thanks,
Aditya G

