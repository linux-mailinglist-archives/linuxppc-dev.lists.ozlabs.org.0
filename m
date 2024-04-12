Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85E8A2468
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 05:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG2611Ky4z3vdx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 13:26:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zte.com.cn (client-ip=63.216.63.40; helo=mxhk.zte.com.cn; envelope-from=li.hao40@zte.com.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 48927 seconds by postgrey-1.37 at boromir; Fri, 12 Apr 2024 13:25:56 AEST
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG25c1GSVz3d4D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 13:25:53 +1000 (AEST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4VG25W0SDPz8XrRG;
	Fri, 12 Apr 2024 11:25:51 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 43C3PkOW095723;
	Fri, 12 Apr 2024 11:25:46 +0800 (+08)
	(envelope-from li.hao40@zte.com.cn)
Received: from mapi (xaxapp03[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 12 Apr 2024 11:25:47 +0800 (CST)
Date: Fri, 12 Apr 2024 11:25:47 +0800 (CST)
X-Zmail-TransId: 2afb6618a9bbffffffffab7-1093f
X-Mailer: Zmail v1.0
Message-ID: <20240412112547433nW9Ip0D2cBmiCc-YaWRru@zte.com.cn>
In-Reply-To: <2024041151-crewmate-entail-62a5@gregkh>
References: 20240411215017604oDcKsSipiLnfwd2SzAnsj@zte.com.cn,2024041151-crewmate-entail-62a5@gregkh
Mime-Version: 1.0
From: <li.hao40@zte.com.cn>
To: <gregkh@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gdHR5OiBodmM6IHdha2V1cCBodmMgY29uc29sZSBpbW1lZGlhdGVseSB3aGVuIG5lZWRlZA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 43C3PkOW095723
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6618A9BF.000/4VG25W0SDPz8XrRG
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
Cc: linuxppc-dev@lists.ozlabs.org, jirislaby@kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sorry,the patch seems to be corrupt,I will resubmit the patch





------------------Original------------------
From: gregkh <gregkh@linuxfoundation.org>
To: li hao10307857;
Cc: jirislaby <jirislaby@kernel.org>;linuxppc-dev <linuxppc-dev@lists.ozlabs.org>;linux-kernel <linux-kernel@vger.kernel.org>;
Date: 2024/04/11 22:03
Subject: Re: [PATCH] tty: hvc: wakeup hvc console immediately when needed
On Thu, Apr 11, 2024 at 09:50:17PM +0800, li.hao40@zte.com.cn wrote:
> From: Li Hao <li.hao40@zte.com.cn>
>
> Cancel the do_wakeup flag in hvc_struct, and change it to immediately
> wake up tty when hp->n_outbuf is 0 in hvc_push().
>
> When we receive a key input character, the interrupt handling function
> hvc_handle_interrupt() will be executed, and the echo thread
> flush_to_ldisc() will be added to the queue.
>
> If the user is currently using tcsetattr(), a hang may occur. tcsetattr()
> enters kernel and waits for hp->n_outbuf to become 0 via
> tty_wait_until_sent(). If the echo thread finishes executing before
> reaching tty_wait_until_sent (for example, put_chars() takes too long),
> it will cause while meeting the wakeup condition (hp->do_wakeup = 1),
> tty_wait_until_sent() cannot be woken up (missed the tty_wakeup() of
> this round&apos;s tty_poll). Unless the next key input character comes,
> hvc_poll will be executed, and tty_wakeup() will be performed through
> the do_wakeup flag.
>
> Signed-off-by: Li Hao
Did checkpatch say this was ok?
