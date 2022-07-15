Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D45769C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 00:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll5M5396hz3cdY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 08:17:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rV00ECzy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.34; helo=mailout4.samsung.com; envelope-from=joshi.k@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rV00ECzy;
	dkim-atps=neutral
X-Greylist: delayed 563 seconds by postgrey-1.36 at boromir; Fri, 15 Jul 2022 22:57:12 AEST
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lkrwm5Zjkz3052
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 22:57:11 +1000 (AEST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220715124731epoutp04b38b58b6de9711fc4b3fe6d08d62b906~CAX128OR23267932679epoutp04a
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 12:47:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220715124731epoutp04b38b58b6de9711fc4b3fe6d08d62b906~CAX128OR23267932679epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1657889251;
	bh=m4z7uUtLkPe+eWeACNWwje/ASBR0VGJAA/fGfwHaCok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rV00ECzyw+C9NAmNSSR12lRZT2eYOA8l4jtoxGTW86nmgHeEkvDSq07gtf2pmEau4
	 8uKQvpo/Q8s0Wmr/1kQrQZQk56LqQTX7NL4s52l3xSQYFHonspaupHw3ptCGzfvFHR
	 BPrgLXQ1bVeh+u1S58mH/2L7CNhM65ei2htNxG0o=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20220715124730epcas5p2434080647cf8a6114c300c0c94154d5f~CAX1dgH9W0820508205epcas5p2j;
	Fri, 15 Jul 2022 12:47:30 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4LkrjX1Pnhz4x9Pp; Fri, 15 Jul
	2022 12:47:28 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.7B.09566.CD161D26; Fri, 15 Jul 2022 21:47:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20220715124723epcas5p3781182051671984415ac50c42f1b4cb8~CAXusgZzI1756217562epcas5p37;
	Fri, 15 Jul 2022 12:47:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220715124723epsmtrp2ecc6d07bdf61087fd11cbb52914f6e66~CAXuryhi91951219512epsmtrp2u;
	Fri, 15 Jul 2022 12:47:23 +0000 (GMT)
X-AuditID: b6c32a4a-ba3ff7000000255e-8a-62d161dc17b6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	B7.17.08802.BD161D26; Fri, 15 Jul 2022 21:47:23 +0900 (KST)
Received: from test-zns (unknown [107.110.206.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20220715124722epsmtip2a84415a4a3753c84173a8c1b3b73d689~CAXtpZbHk0390703907epsmtip2k;
	Fri, 15 Jul 2022 12:47:22 +0000 (GMT)
Date: Fri, 15 Jul 2022 18:11:58 +0530
From: Kanchan Joshi <joshi.k@samsung.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel crash(block/null_blk) while running blktests (block/10)
Message-ID: <20220715124158.GA25618@test-zns>
MIME-Version: 1.0
In-Reply-To: <9CCFA12F-603C-4C70-844F-83B5C9580BAB@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmlu6dxItJBp23uC323tK2OLiwjdHi
	9/d/rBa/Xm5gsnjc3cHowOoxYdEBRo/zMxYyevRtWcXo8XmTXABLVLZNRmpiSmqRQmpecn5K
	Zl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtBaJYWyxJxSoFBAYnGxkr6dTVF+
	aUmqQkZ+cYmtUmpBSk6BSYFecWJucWleul5eaomVoYGBkSlQYUJ2xqwTD5gK5rJWHHiwlL2B
	8QJLFyMHh4SAicSczcJdjFwcQgK7GSVu7bvPDOF8YpS4e+8MG4TzmVHi9pl1jF2MnGAdTQt3
	sYLYQgK7GCW2vjCGKHrGKHHq3iWwIhYBVYknH/eBrWAT0JS4MLkUJCwioC7xefZ+JpAws0CJ
	RMuMMJCwsIC3xMv1nSwgNq+ArsSvt4/ZIWxBiZMzn4DFOQUcJe5tOQoWFxVQljiw7TgTyFoJ
	gUfsEufvPGSBuM1FYkVnIxOELSzx6vgWdghbSuLzu71sEHayxKWZ56BqSiQe7zkIZdtLtJ7q
	ZwaxmQUyJfrO/WeFsPkken8/YYKEFq9ER5sQRLmixL1JT1khbHGJhzOWsEKUeEjs268FCZEp
	jBIbT3axTGCUm4XknVlINkDYVhKdH5qAbFCoSEss/8cBYWpKrN+lv4CRdRWjZGpBcW56arFp
	gVFeajk8gpPzczcxglOhltcOxocPPugdYmTiYDzEKMHBrCTC233oXJIQb0piZVVqUX58UWlO
	avEhRlNg5ExklhJNzgcm47ySeEMTSwMTMzMzE0tjM0MlcV6vq5uShATSE0tSs1NTC1KLYPqY
	ODilGpjqHJaqJZofXbH111WRVmaOEospecK7OVfKH6+f+5jx2qNH63fHNz96//z0/i+yotZM
	74+ffc5/c0Ndwp2SS4HaSUvmB0/TkNbf6/74z/kVuyde01rEyqu13KBisZ/tAwYn2fkmGQwC
	0gdFflTlhy2c3Lb04hn91Isu09cfPqz3iUtrQ5BXsNeJDO7vBcJrJs9mK/TT2lhzveY1zxuz
	NLU97zdODGaep6q1vWnJvtt9kx5yz5l9Xv7us7xQVeOTEnvkom0fPMoSPLW9v90gY22S45Xz
	u6P8pj5eUHjyyuJvDk6RjdPfTTikf/VO7Oo+4xXLLxhcnX62x6NWcmsHXx6vY/LGwNWisR59
	58WNrWqDlViKMxINtZiLihMBMS7Dpg4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSvO7txItJBp2/RC323tK2OLiwjdHi
	9/d/rBa/Xm5gsnjc3cHowOoxYdEBRo/zMxYyevRtWcXo8XmTXABLFJdNSmpOZllqkb5dAlfG
	gz+rmArOMFWcWv2TqYFxJlMXIyeHhICJRNPCXaxdjFwcQgI7GCXWXuiDSohLNF/7wQ5hC0us
	/PcczBYSeMIo8WeaAIjNIqAq8eTjPpYuRg4ONgFNiQuTS0HCIgLqEp9n72cCCTMLlEi0zAgD
	CQsLeEu8XN/JAmLzCuhK/Hr7mB1i7RRGidnzt7JCJAQlTs58AlbELGAmMW/zQ2aIOdISy/9x
	gIQ5BRwl7m05CnaNqICyxIFtx5kmMArOQtI9C0n3LITuBYzMqxglUwuKc9Nziw0LjPJSy/WK
	E3OLS/PS9ZLzczcxgsNbS2sH455VH/QOMTJxMB5ilOBgVhLh7T50LkmINyWxsiq1KD++qDQn
	tfgQozQHi5I474Wuk/FCAumJJanZqakFqUUwWSYOTqkGpo2KSxZtmSK37nWtwmWV5NVVj1+K
	dv8/tmtXpF7CocqTzQ91ff4c5POby3wtV3D551nXnmyOmZ0XO9Wo4nZjxT1DVZ/3licrek+t
	rAn4sSZa5Z+BqI3w+grl1d9qd2r2M6j7ev2PVt7wNIpDvakhXv2LzcpvXHk31h8/bx41s3qe
	ZMLhzye41j/UtgqpvMnkbxejcXzalVSTOUt8r0/6kahREsucpnhszhYtvW7Wr7NnP7F/+3uK
	6MEND15qi56694Xj7cPpx//G8F7Mj3OPfJvdFH+63IivaULoB7nQmcnvWQ/Nqrwms6k9cH1W
	sr9F3uz1N5Nyyvmfbs5se+Ail1Hvd++1XIhEaFhNAONaIyWW4oxEQy3mouJEABi4gK3eAgAA
X-CMS-MailID: 20220715124723epcas5p3781182051671984415ac50c42f1b4cb8
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----5z7FhDiNVqIrGinT0BtluOzfBNI2flEmVN09niYgIFJo-6e-=_135144_"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220715123722epcas5p209d7ab2411e2ca5d63f5e2e42a83a665
References: <CGME20220715123722epcas5p209d7ab2411e2ca5d63f5e2e42a83a665@epcas5p2.samsung.com>
	<9CCFA12F-603C-4C70-844F-83B5C9580BAB@linux.ibm.com>
X-Mailman-Approved-At: Sat, 16 Jul 2022 08:16:46 +1000
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
Cc: linux-block@vger.kernel.org, vincent.fu@samsung.com, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

------5z7FhDiNVqIrGinT0BtluOzfBNI2flEmVN09niYgIFJo-6e-=_135144_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Fri, Jul 15, 2022 at 06:07:01PM +0530, Sachin Sant wrote:
>While running blktests[*] (block/10) on a IBM Power server booted with
>5.19.0-rc6-next-20220714 following crash is seen:
Ming has posted a fix , please see if this can be tried -
https://lore.kernel.org/linux-block/20220715031916.151469-1-ming.lei@redhat.com/



------5z7FhDiNVqIrGinT0BtluOzfBNI2flEmVN09niYgIFJo-6e-=_135144_
Content-Type: text/plain; charset="utf-8"


------5z7FhDiNVqIrGinT0BtluOzfBNI2flEmVN09niYgIFJo-6e-=_135144_--
