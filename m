Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F7660EBA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 13:26:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpzwS11Vdz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 23:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I5VR5+vk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=matorola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I5VR5+vk;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpzvT2kdxz3bV5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 23:25:55 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so5339923wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Jan 2023 04:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4COzEezxUwScBdBUCQmXBfkEZMLwyu6bk+7AMynRWyg=;
        b=I5VR5+vkAsCwsaI6ASMeQWrTa120CyUxdOBt5Y9vBflQ04CpFbUXl/oT0b0dwXCY89
         kJi0N1tFqkEzvTZZHaJt9I8RKT8splcT/Zl+lL0fKC/eZO89ND0RfB0FU/lCzYUhj+60
         fDvkXsinZrgSvUeZXCEUDeFOrQpES84p7A+qQNd2bdPQzG6dAK8oZ7w0w/pWMik2LjnZ
         bEHwTw3gu37tVxD8H/8geT2VanX+56vAOao3rGJidMAZaaH01FZSARVT2kerssmrYvsU
         zbgM7sxddq6O9884XayiWnbtM5y15B1WGXNX8h5Ey3dY3gWTDuuIdvPNK6JbH2SaiIKU
         Ww8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4COzEezxUwScBdBUCQmXBfkEZMLwyu6bk+7AMynRWyg=;
        b=3C2SPbiGY96iQTQa1eLwkSs7QlFaPjzn+NrNVJRqIEjgvU7tFMcfBC3lHdnMgEH1rf
         rKiFf3OHQjVPG/u8fZB1iZy5I87ZvqgwKUIA0SDEaOcUo+q2fuIa8anWu8/n2Dk2+cw7
         M2lcJ+ZBgbsuOdcpCpfb+970QZkfboxBwk4LMVLiWmy4cB8bJPyQPzvzmvTfxK5LIdCe
         diB6TM54LBOnH0HSg3g9Oc+/gZkNMeWO57oA7430szDUplktgndDjuOiFnTZdqOFoWGx
         C0HC6r5tPNTE06dh1EDml66ya9ENMSZU2cT0m0PLanRTgp18QaQkrb6ZShrvmKzk3iIl
         MxYg==
X-Gm-Message-State: AFqh2kp5tbseclUmI6FpFhSUrtREGzFBLw4QEOvbTvWjKhYMiIRfS2a5
	LOJnZunkqSL3UXqTR52mwtt/kTi0s4LME8lTqms=
X-Google-Smtp-Source: AMrXdXuoxk+kSH4s4jQ1Y0U/fOWreciZvBdhze/y2hpfixFDrnEwat9Yno2iIxYY6rxJOYP7almCdI7xoruT/azd9Gw=
X-Received: by 2002:a05:600c:4153:b0:3c6:c182:b125 with SMTP id
 h19-20020a05600c415300b003c6c182b125mr3835738wmm.145.1673094347954; Sat, 07
 Jan 2023 04:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20230106220020.1820147-1-anirudh.venkataramanan@intel.com> <20230106220020.1820147-2-anirudh.venkataramanan@intel.com>
In-Reply-To: <20230106220020.1820147-2-anirudh.venkataramanan@intel.com>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Sat, 7 Jan 2023 15:25:36 +0300
Message-ID: <CADxRZqw2K1QT2cEa6U_4DUxgYrwMiZzU4Qy6iXVm2WRTYVa=xw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/7] ethernet: Remove the Sun Cassini driver
To: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, linux-mips@vger.kernel.org, linux-pci@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 7, 2023 at 1:00 AM Anirudh Venkataramanan
<anirudh.venkataramanan@intel.com> wrote:
>
> In a recent patch series that touched this driver [1], it was suggested
> that this driver should be removed completely. git logs suggest that
> there hasn't been any significant feature addition, improvement or fixes to
> user-visible bugs in a while. A web search didn't indicate any recent
> discussions or any evidence that there are users out there who care about
> this driver. Thus, remove this driver.
>
> Notes:
>
> checkpatch complains "WARNING: added, moved or deleted file(s), does
> MAINTAINERS need updating?". The files being removed don't have their
> own entries in the MAINTAINERS file, so there's nothing to remove.
>
> checkpatch also complains about the long lore link below.
>
> [1] https://lore.kernel.org/netdev/99629223-ac1b-0f82-50b8-ea307b3b0197@intel.com/T/#t
>
> Suggested-by: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>

Do we drop/delete a working functionality by only taking in account
git activity ?

What is a proper way to decline patch series (vs Acked-by) ?

Thanks.
