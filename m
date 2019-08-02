Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6017FC11
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 16:23:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460TtD651KzDrDf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 00:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460T5q6LpRzDrC0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 23:48:47 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72DkZBt091280; Fri, 2 Aug 2019 09:48:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u4nrqsetm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Aug 2019 09:48:34 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x72Dl1Nc093221;
 Fri, 2 Aug 2019 09:48:33 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u4nrqsesp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Aug 2019 09:48:33 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x72DjUYS008189;
 Fri, 2 Aug 2019 13:48:32 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 2u0e85wry3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Aug 2019 13:48:32 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x72DmV0a55181734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Aug 2019 13:48:31 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBF13112062;
 Fri,  2 Aug 2019 13:48:31 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E307112061;
 Fri,  2 Aug 2019 13:48:30 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.147])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  2 Aug 2019 13:48:29 +0000 (GMT)
Message-ID: <324f76484616473f8842cf26678abc5bd68a258a.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] pseries/hotplug-memory.c: Change rc variable to bool
From: Leonardo Bras <leonardo@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Fri, 02 Aug 2019 10:48:29 -0300
In-Reply-To: <78612e21-de54-4bd2-c22f-1c67aed29b2e@redhat.com>
References: <20190801231055.19603-1-leonardo@linux.ibm.com>
 <69821502-a449-d1a8-c2e8-a1aa67cca02f@redhat.com>
 <78612e21-de54-4bd2-c22f-1c67aed29b2e@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-2d0TCPWTvo5CtPychdE9"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020142
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
Cc: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 YueHaibing <yuehaibing@huawei.com>, Paul Mackerras <paulus@samba.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-2d0TCPWTvo5CtPychdE9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-08-02 at 09:23 +0200, David Hildenbrand wrote:
>  subtle changes in a "Change rc variable to bool"
> patch should be avoided.

You are right.
If it was a valid change, I should give it a patch for itself.
I will keep that in mind next time.

Thanks for helping!

--=-2d0TCPWTvo5CtPychdE9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl1EPy0ACgkQlQYWtz9S
ttSG7hAA35fzoY8Uf6QlMYIzT5tFCJFMi9XDduN5Lkey2lS8rr3d+Ihmd+2AhMqG
V20mXTUHUo3zKbpqLjYkuL5PnqI319j53Qj4FuS9hqlZTz0U+4mS0KXyywb41V1A
i0tWj6A7beFoC0p+awdWPio/5X5iXWA4cCQii7p/d+NNJb/XqXELnN0dlDgKAmin
QDbuyajt1dXAepISnzMQUmR5PJ8CHGTBRk0Oc9a/qP0O0QnkhfrL8nS8j1PsoNZY
bV+XXQ/Y2gTnv0ByfwlsDkL3JcDBfggRkJuQRcVdoE4tSLShpE5nrjUrtTpTdq3P
jKg92tQCrSA9YTkC/ddL7NQE9m1yERzCHlypjDNqwKnI8/slUtPfVgH+wgCY5ObS
FJaeC6EYpQsAuxMNdKPZG7beL+8MNjH1uhgbZC2eWGO+wnJRyowZ+i4Xe5aYV/Aw
qE6Ud5Tb/jKMyizOPBxeZ48IGfmKVKkwZvbluXqvhjSytKxjsn+RZCky3qY8jh8p
Ppp1/VtshnAELCPmQ/R7+5N0f4i8k6L8YoAooR8ff6apXWl4QLvikpUtczkVl7hm
X+h8K7qg1wYrAdT+nE5owqYzX5HmDi8z/ne9cCgooVq7MzY+ppBkYCC7OKW+49tB
vzF2WsIB62UbNKONXCB/H1IpD32pPS6YPr8TCg6fmbEIKS4Z3VM=
=ys0t
-----END PGP SIGNATURE-----

--=-2d0TCPWTvo5CtPychdE9--

