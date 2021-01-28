Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D2307C29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 18:23:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRS3T6KC5zDqLG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 04:23:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZMmSPnpm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRS182h86zDrb6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 04:21:00 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SH2JMT021222; Thu, 28 Jan 2021 12:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=iY57LuSLr2oYwoOL8GSy52rBFT8/92Ao6DafqS2vOlg=;
 b=ZMmSPnpmkjKlZ6/+YNN113MECSpLpdtchxOKRHuDlasWcZz5boeY3WiRuchy/wcGWCbG
 Khn900a8FK7P7WNhMWK+9DJ+oqimvOH5UzttK/wOf6aoT2IBbl4/kRZLVMMYCMYRwgrP
 g3NihKUGQa3VoJZmWFzP2CTFRZdMVLm+XpyGsHI6pihyYIz2GNvhJnCBjHK9Fb5zgiZl
 X7qmePpP1t71KsXcdpwRg3dZ4BQdPNWfU8G3kiqFem/YuHTMNyrIrwy0hvBbjdtE+Wet
 k6nNwK9qASzAxrMBvQ+lk/Ai8YzUTOZ+PSmIRpXwlSM3hNynhbmca9wzdBhglc+awajn 8g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqterx5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 12:20:52 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SH2Qp2022003;
 Thu, 28 Jan 2021 12:20:51 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqterx4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 12:20:51 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SHBpIL028382;
 Thu, 28 Jan 2021 17:20:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 368be8amce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 17:20:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10SHKc2C33096098
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 17:20:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41F304203F;
 Thu, 28 Jan 2021 17:20:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B73C142045;
 Thu, 28 Jan 2021 17:20:45 +0000 (GMT)
Received: from localhost (unknown [9.77.192.88])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 17:20:45 +0000 (GMT)
Date: Thu, 28 Jan 2021 22:50:43 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] powerpc/sstep: Fix array out of bound warning
Message-ID: <20210128172043.GB117@DESKTOP-TDPLP67.localdomain>
References: <20210115061620.692500-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115061620.692500-1-ravi.bangoria@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280081
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
Cc: naveen.n.rao@linux.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/01/15 11:46AM, Ravi Bangoria wrote:
> Compiling kernel with -Warray-bounds throws below warning:
> 
>   In function 'emulate_vsx_store':
>   warning: array subscript is above array bounds [-Warray-bounds]
>   buf.d[2] = byterev_8(reg->d[1]);
>   ~~~~~^~~
>   buf.d[3] = byterev_8(reg->d[0]);
>   ~~~~~^~~
> 
> Fix it by converting local variable 'union vsx_reg buf' into an array.
> Also consider function argument 'union vsx_reg *reg' as array instead
> of pointer because callers are actually passing an array to it.

I think you should change the function prototype to reflect this.

However, while I agree with this change in principle, it looks to be a 
lot of code churn for a fairly narrow use. Perhaps we should just 
address the specific bug. Something like the below (not tested)?

@@ -818,13 +818,15 @@ void emulate_vsx_store(struct instruction_op *op, const union vsx_reg *reg,
                        break;
                if (rev) {
                        /* reverse 32 bytes */
-                       buf.d[0] = byterev_8(reg->d[3]);
-                       buf.d[1] = byterev_8(reg->d[2]);
-                       buf.d[2] = byterev_8(reg->d[1]);
-                       buf.d[3] = byterev_8(reg->d[0]);
-                       reg = &buf;
+                       union vsx_reg buf32[2];
+                       buf32[0].d[0] = byterev_8(reg[1].d[1]);
+                       buf32[0].d[1] = byterev_8(reg[1].d[0]);
+                       buf32[1].d[0] = byterev_8(reg[0].d[1]);
+                       buf32[1].d[1] = byterev_8(reg[0].d[0]);
+                       memcpy(mem, buf32, size);
+               } else {
+                       memcpy(mem, reg, size);
                }
-               memcpy(mem, reg, size);
                break;
        case 16:
                /* stxv, stxvx, stxvl, stxvll */


- Naveen

