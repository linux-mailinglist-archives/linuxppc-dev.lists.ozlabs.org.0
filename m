Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322B252293
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 23:14:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbhZQ1LZxzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 07:14:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mmc@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iQLsyNe0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bbbvr576vzDqVK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 03:44:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PHWbHE116254; Tue, 25 Aug 2020 13:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=oHAo9OFkjeU8v9gjAXzDP/jfc7LBLDfXJAvxi5wHfJY=;
 b=iQLsyNe0rNJ6yW8lKEU1Kz4d9aDLDGu3VDOX8/N6pUvvQkmakXqrLlFSMDwK0KfKZRVd
 14A625Qyf3X41Sr0k2Nbru4VTqLPTp3Yf49BmkPePyQvcCI2/9bWTVlKWZQSjB4Mp+jX
 TqOZH0HmwlB8ugOQl4xYQaBU8sG0sCzozx6vaf4rSKruBKIbXaTW5OShNvg4kyP74iXF
 ac9URQlWj1bGiScZSKwdSfu/Ib3DCtNfMxU0b7PwUxyRL3R55JZF0lyDBr/SgudAthxp
 gzHwYp+gGqz+yiF2F+2RGwElXUaybi8uYmDxiT9KePELEG8Do95BRaBf+4OnXAK/yKVZ Zg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3356de9qch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 13:44:01 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07PHhrs0024602;
 Tue, 25 Aug 2020 17:44:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 332utua440-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 17:44:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07PHhxEd53543238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 17:43:59 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C8BB6E04C;
 Tue, 25 Aug 2020 17:43:59 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64EE66E054;
 Tue, 25 Aug 2020 17:43:58 +0000 (GMT)
Received: from [9.85.168.187] (unknown [9.85.168.187])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Aug 2020 17:43:58 +0000 (GMT)
Subject: Re: [PATCH net v2] ibmvnic fix NULL tx_pools and rx_tools issue at
 do_reset
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: Mingming Cao <mmc@linux.vnet.ibm.com>
X-Apple-Base-Url: x-msg://16/
In-Reply-To: <20200825.100805.388932748785591114.davem@davemloft.net>
X-Apple-Windows-Friendly: 1
Date: Tue, 25 Aug 2020 10:17:55 -0700
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <3BBAE13F-6EFD-4A66-B0FD-6623F2411F88@linux.vnet.ibm.com>
References: <20200825165606.806674-1-drt@linux.ibm.com>
 <20200825.100805.388932748785591114.davem@davemloft.net>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: David Miller <davem@davemloft.net>
X-Mailer: Apple Mail (2.3445.104.14)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_08:2020-08-25,
 2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 suspectscore=1 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250129
X-Mailman-Approved-At: Wed, 26 Aug 2020 07:12:44 +1000
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
Cc: drt@linux.ibm.com, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On Aug =
25, 2020, at 10:08 AM, David Miller &lt;davem@davemloft.net&gt; =
wrote:<br><br>From: Dany Madden &lt;drt@linux.ibm.com&gt;<br>Date: Tue, =
25 Aug 2020 12:56:06 -0400<br><br><blockquote type=3D"cite">@@ -2011,7 =
+2017,10 @@ static int do_reset(struct ibmvnic_adapter =
*adapter,<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;adapter-&gt;req_rx_add_entries_per_subcrq =
!=3D<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span> &nbsp;&nbsp;&nbsp;old_num_rx_slots ||<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;adapter-&gt;req_tx_entries_per_subcrq !=3D<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;old_num_tx_slots) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;old_num_tx_slots ||<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>!adapter-&gt;rx_pool ||<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>!adapter-&gt;tso_pool ||<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>!adapter-&gt;tx_pool) =
{<br></blockquote><br>Please don't over indent these new lines, indent =
them identically as the<br>lines above where you are adding new =
conditions.<br><br>Thank you.<br></blockquote><br><br>Okay, good catch. =
&nbsp;thanks!<br><br>Mingming</div></body></html>=
