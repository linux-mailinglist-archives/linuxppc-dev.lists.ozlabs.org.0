Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15D367952
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:31:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQmHk6DQbz2yxN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 15:31:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mWiMnrGp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332;
 helo=mail-wm1-x332.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mWiMnrGp; dkim-atps=neutral
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQmHK3Qd5z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 15:31:06 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so2516263wmg.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 22:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mj6C17t14k8TSaVXI56Xodc1slixWpXlM/wm1wQOczs=;
 b=mWiMnrGpxCs6b4Q/Lr3YvCVaw0JCc92ebP+s1T/fqyp96v4ROx+Yb3gUulLBcsdiuu
 D7aOpYhu3nYCxG8vYJlsAKm5zIBcpm1l2/i40C5Vvjs8XQ8g5C9NYD1W6B/y5Gx9crH4
 s9kV0Uigv/vF3q8+e89HsMw0dmdDYwqMnofiulo8eiBbkSu1tT39iOnNGs/57J9ftJ1x
 Mr3wBtjYnn8auneJhhVvSRzJDJFS+04SV96qhzlkvoQ8oxPQQeGvQjzmX1U31GTks/nf
 y3qL8w34HB7lOJKtg2CekqYRiuxznvGa8oWCaz1nkMwP9PpKmdyn2XLVkzh6ZwPuhdBa
 P55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mj6C17t14k8TSaVXI56Xodc1slixWpXlM/wm1wQOczs=;
 b=CrCtGcOChWIcTU7VWiycHaYTLzTXtzGaFFMzKbmJUwyIFKCfd+j258xYt0rNIHBbSn
 cT8wlrkMkkzGJqIiUtGqveWdMkCxfRMeZcpLApNG1WdncgV5IYY4e3plclovC+h92h27
 cUTlhytpK+AbA0ETMIcpMsbh5jrOC4f7NM5XHCHcrzQauPbC7iwxhh7YPxuPQLgXaZqi
 kloAtO6KMCdN3XMUVFAPMVKB0OtNAwF3O2qAoHyksqj7lBOkWpA3LvBPp4Gc1hRx9a7y
 2guspy5aGz/2dwOZ2W4LY9y1VZhp2XszvKlixvQwV0gp3XlLQMEZI540xX/TqaV/50EP
 0sMQ==
X-Gm-Message-State: AOAM532OFENLIz1bXsWikWVUaLhHomWqM+xeSeDwRIqtjSTvM0EVRfxM
 UCVc0ggGCB8wPy2i1Z6DzD3a4fgqVG5t6wAbqKfsNkdSJdI=
X-Google-Smtp-Source: ABdhPJyw3xLjCPKV8CvXdDbDJTn1lxzydyc8GSfb9uksHVrMsetyNIimDtj2csRnGOWcDbTYZ7J1sWjRvJun7ZW2OVw=
X-Received: by 2002:a05:600c:9:: with SMTP id g9mr1803734wmc.134.1619069462769; 
 Wed, 21 Apr 2021 22:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210420213517.24171-1-drt@linux.ibm.com>
In-Reply-To: <20210420213517.24171-1-drt@linux.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 22 Apr 2021 00:30:52 -0500
Message-ID: <CAOhMmr5XayoXS=sJ+9zm68VF+Jn+9qiVvWUrDfq0WGQ6ftKdbw@mail.gmail.com>
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: Dany Madden <drt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 4:37 PM Dany Madden <drt@linux.ibm.com> wrote:
>
> When ibmvnic gets a FATAL error message from the vnicserver, it marks
> the Command Respond Queue (CRQ) inactive and resets the adapter. If this
> FATAL reset fails and a transmission timeout reset follows, the CRQ is
> still inactive, ibmvnic's attempt to set link down will also fail. If
> ibmvnic abandons the reset because of this failed set link down and this
> is the last reset in the workqueue, then this adapter will be left in an
> inoperable state.
>
> Instead, make the driver ignore this link down failure and continue to
> free and re-register CRQ so that the adapter has an opportunity to
> recover.
>
> Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
> Signed-off-by: Dany Madden <drt@linux.ibm.com>
> Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
> Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>

One thing I would like to point out as already pointed out by Nathan Lynch is
that those review-by tags given by the same groups of people from the same
company loses credibility over time if you never critique or ask
questions on the list.
