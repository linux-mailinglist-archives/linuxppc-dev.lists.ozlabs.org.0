Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E10715829
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 10:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVlcM6Z6wz3f7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 18:17:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Fnat8ZEM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.34; helo=mailout4.samsung.com; envelope-from=maninder1.s@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Fnat8ZEM;
	dkim-atps=neutral
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVlbT2b6fz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 18:16:17 +1000 (AEST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20230530081605epoutp045d66ca1123fef865c49edff16eab5269~j3c6wEoMP1571915719epoutp045
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 08:16:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20230530081605epoutp045d66ca1123fef865c49edff16eab5269~j3c6wEoMP1571915719epoutp045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1685434565;
	bh=5ac7mcvUjipTjuyt2bSsLImVDWiscD6gA99NQK48iBs=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=Fnat8ZEMwWGH3IskToGqsOFf2j0fTLuLglIL46XCr39Wq+zqmZKhvm68EvCCpB/eW
	 aX/OACM0Zbylw+ef6wgUCOYRWwkj/AB/VMK7pjBGqWCSIkglKUyDnp5yJQfgMR0taW
	 k5L7RwARTUW5R0mk60USG/WlB9f4gMWnfGGaloC8=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20230530081604epcas5p2a2caf81b1d6cb14d5bc0d5b3e3cd7b38~j3c50_WwG1821018210epcas5p2E;
	Tue, 30 May 2023 08:16:04 +0000 (GMT)
X-AuditID: b6c32a4b-56fff70000013ffc-8e-6475b0c4a44d
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E2.DF.16380.4C0B5746; Tue, 30 May 2023 17:16:04 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array
 size
From: Maninder Singh <maninder1.s@samsung.com>
To: Petr Mladek <pmladek@suse.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ZHWub0ibU7etLnXK@alley>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230530081405epcms5p879eeba2a521ff23fea57ce42bf913eac@epcms5p8>
Date: Tue, 30 May 2023 13:44:05 +0530
X-CMS-MailID: 20230530081405epcms5p879eeba2a521ff23fea57ce42bf913eac
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPKsWRmVeSWpSXmKPExsWy7bCmuu6RDaUpBs39/BZ/Z29nt3i4u4XF
	4s6k5+wWF8+8ZrQ4051r8b5lB5vF5V1z2Cx+f//HarF4uZrFzelv2C22NBxis9hwNNji54sb
	LBYr5y9ntFjR84HV4v/jr6wW+zoeMFn8f3eEyWLDsrWMDsIesxsusnh8vXmOyWPRywYWjyWd
	v5g8ds66y+7Rsu8Wu8emVZ1sHhMWHWD0OD9jIaPHxD11Hn1bVjF6rN9ylcXj8ya5AN4oLpuU
	1JzMstQifbsErozlZz+yFDxhr2hduYCtgXETWxcjJ4eEgInE7cWHmboYuTiEBHYzSqy/NI+1
	i5GDg1dAUOLvDmGQGmGBAIkFe5cygthCAooSF2asYQQpERYwkPi1VQMkzCagJ7Fq1x4WEFtE
	QEni1fy7zCAjmQU+s0msm7+bEWIXr8SM9qcsELa0xPblW8HinAKqEtdaVkPViErcXP2WHcZ+
	f2w+VFxEovXeWWYIW1DiwU+YmTISqzf3Qs2slnj6+hwbyGIJgRZGiX27YYrMJdYvWcUO8Zev
	ROujFJAwC9Deb6smQpW4SJyfcpwVxGYWkJfY/nYOM0g5s4CmxPpd+hAlshJTT61jgijhk+j9
	/YQJ5q0d82BsVYmWmxtYYV78/PEj1GkeEqe+r2KFBPNHJomJC1tYJzAqzEKE9Cwkm2chbF7A
	yLyKUTK1oDg3PbXYtMA4L7Vcrzgxt7g0L10vOT93EyM4TWp572B89OCD3iFGJg7GQ4wSHMxK
	Iry2icUpQrwpiZVVqUX58UWlOanFhxilOViUxHnVbU8mCwmkJ5akZqemFqQWwWSZODilGph4
	csMjNTYyWj9Jr5oyo6Xxz/4UV6H/EpkTtXWlzR+u4+0ofvpVti9zTv9693aFR7KC+TWrNp3I
	Xfhv3/YEtk2rdA+HlTjf+Nrb7S2Qzb88bnFkUqDTFWWpV+zn3HeFlxf09jE0ZD9vzlzHkiR4
	9XlfVeeXWTum2d2P8866cfDc0atZ1rdPCc5rdd3yz1Lh+/7bvUV+l29t7T+5q/mN0JGHn031
	ohNmOS5Yep+nxHSf45y159r1vrrvvRS16sn0voYbOZErZZQPMTze/q6bTWuyuOTdvpK808fW
	bN0x596KYK0T/k6H415/m+msrtHQqHp8Ft+3ebPblquyztt4ZkPR5+7+u38qGIsPzu2V9tiq
	xFKckWioxVxUnAgAVvt/uAIEAAA=
X-CMS-RootMailID: 20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3
References: <ZHWub0ibU7etLnXK@alley>
	<20230529052821.58175-1-maninder1.s@samsung.com>
	<CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
	<20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
	<CANiq72n_eso7_pgna8ukmEnuCQPsKYPr0NU-Ss9Nwv0VzX=etg@mail.gmail.com>
	<CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p8>
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
Reply-To: maninder1.s@samsung.com
Cc: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, "bcain@quicinc.com" <bcain@quicinc.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "gary@garyguo.net" <gary@garyguo.net>, Onkarnath <onkarnath.1@samsung.com>, "ustavoars@kernel.org" <ustavoars@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

>
> The best solution would be to pass the buffer size as an extra
> parameter. Especially when some code passes buffers that are
> allocated/reserved dynamically.
> 
> Sigh, I am not sure how many changes it would require in kallsyms
> API and all the callers. But it would be really appreciated, IMHO.
> 

yes we already prepared size changes 5-6 months back:

https://lore.kernel.org/lkml/YonTOL4zC4CytVrn@infradead.org/t/

[PATCH 1/5] kallsyms: pass buffer size in sprint_* APIs

But at that time  new API development(for replacement of seq_buf) was in progress and we decided to wait for that completion.

https://lore.kernel.org/r/20220604193042.1674951-2-kent.overstreet@gmail.com

https://lore.kernel.org/r/20220604193042.1674951-4-kent.overstreet@gmail.com

As I checeked these APIs are not pushed to mainline.

we will try to prepare new patch set for kallsym changes again 
with seq_buf to take care of length argument.

Thanks,
Maninder Singh
