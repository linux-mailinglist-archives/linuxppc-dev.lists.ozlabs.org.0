Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B55856C2AE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 07:56:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgj794jh7z3cP0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 17:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Ct+7pVgm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Ct+7pVgm;
	dkim-atps=neutral
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pgj6959lyz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 17:55:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679381687; i=markus.elfring@web.de;
	bh=XXleG++6MeURy/E/vOgvu/1108sao7Di03RTgqbkGWA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ct+7pVgmenY5Jwo9XuK+OiUmU+eysI50+S87bPkTnQxzAhIyHT+G8h2vA7YaBhvwJ
	 ZrLUS9GIcanoIbmGbjDmuLXwicnl5QD54BLwFPGtwQArL1NCjlJ1cGFZt6l34VCjtI
	 P8CjzMqEJQ/v4uncLJlteTrDcSzi047HeJfRYrMXSy154fPKlVbsLegVCgOfZ7d+sN
	 Z0qrI988CU7gPGZoSftA0zROXL4I3wTZrepnM3BpouxWAVO19iuLl77jKhWGM74fFC
	 aKslXn2aI9oHVdic2fg8enOEp1oOtwegtveN1mJGLzqFnca17tTtHSL9i2UZQAY8Dy
	 8HhV8fzvZblPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgub-1qUYqe1PMV-00v9Ns; Tue, 21
 Mar 2023 07:54:47 +0100
Message-ID: <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
Date: Tue, 21 Mar 2023 07:54:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: powerpc/pseries: Fix exception handling in
 pSeries_reconfig_add_node()
Content-Language: en-GB
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <87pm9377qt.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7Kuxt/8RJeURdT0ekwdlRTjO+znwTwfklysqtixQNqfsAEVZXCm
 37TgaXMOOE+ST41juFnzukMWOtaFhrpoTCMvamNmvTLy5TFJ4F0JEX7VG70u0M8umU9Ejxx
 WjcwIpdJy6Ak/yNJz7cAd85rIkSWjp15mS++Xqw3jlrZkUHBvxgOlUiuyiG1/gECncwgKEW
 9/tuJih+uV9Oa7OH2/WWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vDaPWzYeOp8=;WBSZDpG4NMLE0ZKPLVAjK13ag4S
 xvAOonxBcha1mdjqJU8DPaakQ+ufdXKmD/XnNrRyfTTUwgXLeg52hbeFr+HjcbPdUuF4jlZqa
 fEmfD5mwIoey/X+T0aGfgEIq0/IG4ONFGraA6IFffqLd1RaMgwQ7dkB/Cd/83mzSbpZIjxhJj
 CX2luKPeC8283bfxtCOMXAX1m+yFI5Dq98j3mVBt+lF31ac35a9JLB9e7w5WeScy3IbEvIXvI
 x0FKYQc3qCUe39d3258zYltTJOPxf8FoOqWrCmzwxgvqcfRjm/C5zihmqp//lo7yYSabpV5GV
 c+WAxZIz90g8qmb/4W+BNd7cDY+SJI/nR3SJgCTi+bOK0mF9jFtPQPWoPLCsj5I3IZ3OK7Oqt
 q2jh4fq91HddShijl37Z9+sxAsSDYHiPjW1UxrhWdFPoTRe1Gm5FxGOHP+Fw4Jl21GSvXMkF2
 wwpKpOhpiNdpT2y8NcN3DoNBjuZmYuNBbjRWcbnWIwbykBPAoIxkh6xcBWe9dfpvWA6KGy94b
 D/gLhibYYcUISSIkSQLzmrfYP96jvGOmkyYJ+wUuAHuHHSdir9JP9AtJid99L2BMHdHRGerK9
 rverVzFGr84LtAs0E3Y5Ern2DsX85HZxaGk6aR+7ShG4tgHrOqO841mARS07f0d8C60HWn8HB
 lcIh8XoVKzVzsdfa4JdNAIF5GMRar/BcesJPLhr0kAu0Fws9TMKGYjKBjis1P0pPeUXwPvTBm
 iwgr9b1BuwGFFPhzUz9IyCrCs6t+X0gc8IwkFaVuu4NcIkQAvAAz8N0B4iJDZ9hHiADgkPbir
 QzXQInbT2qCAPzioe+46GgVdjJNwnmNA1EseAShICGizIFLbq7qzXVfmbWyLfgYSfr2BI6DdM
 n/okfeDE0KlJwFvTsyc8nUiDHfJfPdHlK7oekO7PivRI/VYO5hKx15tWn5lofFPt8dupGQezH
 txNxrw==
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
Cc: Paul Moore <paul@paul-moore.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> It's been brought to my attention that there is in fact a crash bug
> in this function's error path:

How do you think about to mention any other contributors for attribution
according to this issue?


> np->parent can be an encoded error value, we don't want to of_node_put() that.

Will the development attention grow for any more cases?


> I believe the patch as written happens to fix the issue.

Is it interesting how many details can still be improved (by my change suggestion)
also for the discussed function implementation?


> Will you please write it up as a bug fix and resubmit?

Another proposal will follow.

Regards,
Markus
