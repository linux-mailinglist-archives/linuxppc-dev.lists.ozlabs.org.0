Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4519680E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 18:17:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qQQ26Xl9zDqjT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 04:17:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
X-Greylist: delayed 339 seconds by postgrey-1.36 at bilbo;
 Sun, 29 Mar 2020 04:15:26 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qQMy5yJszDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 04:15:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1585415712;
 bh=dp1GKouWBjQqOB+ojyOU13ZTS84ir0o6/zbgj0ckUmY=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=AgIwWjcYu+FhOq5o8s/nNyYfZfYSu5gFXmi5eFSt+Xy6vDzrkZBhIktw26K9OgI01
 MGUpb1p075daAm2hrRsjceITpwYoNZBYCLB2IAV/+ovOLSxPqXtxoh4R/xxOcPIYZ3
 OWw+5nxF8HJa+GjHcJvbrYrbPzPJTrwkC4vnaib8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.150.134]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MWRoI-1ikp7O121y-00Xcx9; Sat, 28
 Mar 2020 18:09:16 +0100
Subject: Re: [PATCH 1/9] powerpc/ps3: Remove duplicate error messages
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <cover.1585340156.git.geoff@infradead.org>
 <1bc5a16a22c487c478a204ebb7b80a22d2ad9cd0.1585340156.git.geoff@infradead.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a9dfe191-1e89-abca-cb02-ab6c50b5b80b@web.de>
Date: Sat, 28 Mar 2020 18:09:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1bc5a16a22c487c478a204ebb7b80a22d2ad9cd0.1585340156.git.geoff@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:FzhUhZAQuaF3gOzb98S9gmS6VHc3ucOCKbU7IMdbqIkTWMvlqMd
 3lLfQ/ykF5SQ80oC/39jSeDTdfToNrviy6OB0DoqMjXlktXFAepEhpeOsHWm58DfRBVGn74
 Zv2K7f4YbF1/J+lXMp5N3cnE43N9nWBITbG5DeBW/nfk01lXyJnF5UFBCxtD7j2ph+O1dYf
 oLRVZHdR0Jp4MsWWTxdOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:stSLDtPtxBs=:MkzosMPj+j8IuEyVQ83Ta0
 vNWfZVLDg5suYtKm9d2FMqkypU6LV/eWwZGycO647XGcSgQ6Uuhc7/9POEimQ42tzuSR2IugA
 5d5sQBk43h84RobykRN3ERAuehAmqRjVawM8fkQFcxz0mMr0DUjsuWls4wNbsLMk1h81sT6lw
 uwJ+3X74xx1XVvbWX/XaTUpVq1H/tMuEMx089SFRscN9/g1izjZqhWxsVpCfJBcPp98Buw4dq
 rQC2sPgzgzwjft5w/fLOJPtHsIapGL5TGYlnTkaWQw2m5BNx0AdD8/8PzfC9KGzh5cjmjzDY8
 OK38Weht1agJr+3LhgDV/AWWoLGYx0Loywd2H5jda7XFFODnLodI0jXdmMgcG2xAHhvnrZL+t
 9hV2M1Vo1R92cPK/6bn5kltH+uK1GF60lN69h6jUdn92a66mCROi3lJHfVz7Tl1iVEjNXSjVy
 HYL/vSizBoBCHa2YH8D5P5vy2NzVRss2pQw6HgFbEswiKJaa+gvOdZ4dzhyZJe0I71NtgMJco
 U6adb1C8CCyLn+DLHmN805blcxrh8OTwJhL3pBPEXzxOMfcw9FibVI6FeGmsBOI6p74t0ovlU
 tsk8QpU8uFZx/PhB+lt2yJNNRSCCpuIvMVPGvwyvuUtrtJQoRAQJtvHJtRdFIie0fOyV2vwmQ
 CQy0NO8IpJSGzy2Ujfm15eRKeFo1w6CouK2/5xoUSGITYV9RDVLsoSTnkyZ0X53Rg4O9ETNWB
 zOfYO3WK3qOG36zXqSDwvDvctIvf0crddExFkR+3Uq6LDV2xyZ+Hef6oafIgu56Kn/1Jq/Pug
 wRoFQJ3FqcvDPuFrH6UhSdvkwJ7w+GV1XFGVv9ZVTktjNhppJDkiPffGwzOJEsz1/Jgb4uWLv
 Ym/j2DKk7xhvlkHXnKrGLPenmJik72iZUPCrcntlaLFqJg98qf/2aicnLLedQOZ1Eez6zQzwz
 H1LGSCJTZWqp+1R25mRjMYg1aPFrbQqSIVSlZrHHD1cHjZ4NVNB7dQK55lsJrfjHTR/jo60Ra
 hLNDdXsh8c6qL/ub+l8v7Rq/PDJ7swVKepEk6QaTSf+e35lzmK6Mh405uMss9ef0C7GJL5H6G
 +JnHBSbE4r26BQ++I7eTpvuywP4UbTFDJhgjQNNUsQT8G881jW+KhFIr/HEm+j6119969MjBA
 xGWcVenZO9wcU7Dh3Nyz0tGJ3d2GgIvOSkTI83UFXR3RChvl/hjUV7C+FH14BKrpgiN6nyuoa
 RRILLK2oPVuBlpAy0
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Remove duplicate memory allocation failure error messages.

A single message can be omitted here.
https://lkml.org/lkml/2017/10/17/870
https://lore.kernel.org/patchwork/patch/842101/
https://lore.kernel.org/linuxppc-dev/e16c8b7d-de3a-6c96-9af4-dd0551cca805@users.sourceforge.net/

Will this detail be reflected in the final commit message?

Regards,
Markus
