Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D993F714859
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 13:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVCTt4vL2z3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 21:09:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mSik56Pf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.24; helo=mailout1.samsung.com; envelope-from=maninder1.s@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mSik56Pf;
	dkim-atps=neutral
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVCSz73pSz3f6T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 21:08:49 +1000 (AEST)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20230529110838epoutp0106f08dc24a9a81fc8eac0f63cb731e3f~jmKSu-kn-2902729027epoutp01M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 11:08:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20230529110838epoutp0106f08dc24a9a81fc8eac0f63cb731e3f~jmKSu-kn-2902729027epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1685358518;
	bh=dZVfotqZFrsokbs+wqGDWxA2HIP1xtUvpW9KT5S6V/g=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=mSik56PfWyps25P0F27uNOkKOxyJzsXVnUURn9lmV4y5b8ai/sDKbVAoVFHQsb3WE
	 lotiS4me6f9y3aDafyDvpHVV1abOM/qOM6tC+SZ4G3hAOE2CXOTkFA5kcxXoyjaYWV
	 idqSz0qyNhYihTZJazdfDEInFl+6L/tvKQFvV7HY=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20230529110838epcas5p2aeb7ad05e010a427b9dccb1f0866323c~jmKSLeDPK3208332083epcas5p2a;
	Mon, 29 May 2023 11:08:38 +0000 (GMT)
X-AuditID: b6c32a49-db3fe700000011d7-a7-647487b56532
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C6.82.04567.5B784746; Mon, 29 May 2023 20:08:37 +0900 (KST)
Mime-Version: 1.0
Subject: RE: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array
 size
From: Maninder Singh <maninder1.s@samsung.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20230529105707epcms5p1418eac680ebe1736196706b0db80dd39@epcms5p1>
Date: Mon, 29 May 2023 16:27:07 +0530
X-CMS-MailID: 20230529105707epcms5p1418eac680ebe1736196706b0db80dd39
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7bCmlu7W9pIUg81/rSz+zt7ObvFwdwuL
	xZ1Jz9ktLp55zWhxpjvX4n3LDjaLy7vmsFn8/v6P1eLm9DfsFlsaDrFZbDgabPHzxQ0Wi5Xz
	lzNarOj5wGrx//FXIPHuCJNFx+KVjA6CHrMbLrJ4fL15jslj0csGFo8lnb+YPHbOusvusWBT
	qcemVZ1sHhMWHWD0OD9jIaPHxD11Hn1bVjF6rN9ylcXj8ya5AN4oLpuU1JzMstQifbsErozF
	h9ILfnBXHNv0ibmB8RxnFyMnh4SAicTii+9Yuxi5OIQEdjNKnFowj62LkYODV0BQ4u8OYZAa
	YYEAiQV7lzKC2EICihIXZqxhBCkRFjCQ+LVVAyTMJqAnsWrXHhYQW0TASOLa6d0sICOZBeaw
	Sdzb2s0EsYtXYkb7UxYIW1pi+/KtYHM4BQIlnn5xgQiLStxc/ZYdxn5/bD4jhC0i0XrvLDOE
	LSjx4OduqLiMxOrNvVAjqyWevj7HBrJXQqCFUWLfbpgic4n1S1aBDeUV8JV4PbkR7B4WAVWJ
	/r1NUDUuEk+uTmUFsZkF5CW2v53DDHIbs4CmxPpd+hAlshJTT61jgijhk+j9/QTurR3zYGxV
	iZabG1hhXvz88SPUbR4Sp76vYoUE4WlGiRNPRCcwKsxCBPQsJItnISxewMi8ilEytaA4Nz21
	2LTAMC+1XK84Mbe4NC9dLzk/dxMjOB1qee5gvPvgg94hRiYOxkOMEhzMSiK8tonFKUK8KYmV
	ValF+fFFpTmpxYcYpTlYlMR51W1PJgsJpCeWpGanphakFsFkmTg4pRqY8irfuT68Nf9+6Rvv
	UL03P9NfZbkcvjV33ifuro0GLMdCp6zcO8urs8FYLSLT1+2M0Idp+rXavZ8mzJbi92aUEzTx
	9Yt41etamlM6T/L45HsT7zLGfEyveFuZ9mP+tFlhs6+7vLywZd3yP81Z775+q++9cyek9Gf0
	3MRtzJMFCp9qMn5/OCPFdu67sJfFD20TXO6Wab3n2P7L1/0zd0aoZr1wnFPb3J9Wm+R++TF0
	1vdO6F5u92KW0H6fZfOmGXKI10+0LNtQc/rTVTZBtkPXohzOf3H8FPPUMcs7Mn7m41Naf15y
	mx06cbhX9FzSffcfZTmR/70e3D11vumN1U/2jm+Woaz3V388uud1/zLTw0osxRmJhlrMRcWJ
	AJjKocv2AwAA
X-CMS-RootMailID: 20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3
References: <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
	<20230529052821.58175-1-maninder1.s@samsung.com>
	<CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcms5p1>
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
Cc: "nathanl@linux.ibm.com" <nathanl@linux.ibm.com>, "bcain@quicinc.com" <bcain@quicinc.com>, "keescook@chromium.org" <keescook@chromium.org>, "gary@garyguo.net" <gary@garyguo.net>, "pmladek@suse.com" <pmladek@suse.com>, "ustavoars@kernel.org" <ustavoars@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Onkarnath <onkarnath.1@samsung.com>, "wedsonaf@google.com" <wedsonaf@google.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

>>
>> kallsyms_lookup which in turn calls for kallsyms_lookup_buildid()
>> writes on index "KSYM_NAME_LEN - 1".
>>
>> Thus array size should be KSYM_NAME_LEN.
>>
>> for powerpc and hexagon it was defined as "128" directly.
>> and commit '61968dbc2d5d' changed define value to 512,
>> So both were missed to update with new size.
>>
>> Fixes: 61968dbc2d5d ("kallsyms: increase maximum kernel symbol length to 512")
>> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
>> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

> Thanks for this!
> 
> There is no `From:` at the top. Since I cannot locate the patch in
> Lore, did you mean to put both of you as authors perhaps? In that
> case, please use a `Co-developed-by` as needed.
> 

I Will add co-developed-by` tag.
because this change was identified while we were working on kallsyms some time back.
https://lore.kernel.org/lkml/YonTOL4zC4CytVrn@infradead.org/t/

this patch set is pending and we will start working on that again, so i thought better
to send bugfix first.

> Perhaps it is a good idea to submit each arch independently, too.
> 

ok, I will share 2 separate patches.

> The changes themselves look fine on a quick inspection, though the
> `xmon.c` one is a global buffer (and there is another equally-sized
> buffer in `xmon.c` with a hard-coded `128` constant that would be nice
> to clarify).

Yes, I think second buffer was not related to kallsyms, so I have not touched that.

Thanks,
Maninder Singh
