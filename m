Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9252C3A4E15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 11:55:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2CkW1MN3z3c6N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 19:55:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2Ck42gbYz2yxr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 19:54:50 +1000 (AEST)
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfYgC-1lPINR2YXY-00g1oN for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun
 2021 11:54:45 +0200
Received: by mail-wm1-f49.google.com with SMTP id b205so4636897wmb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 02:54:44 -0700 (PDT)
X-Gm-Message-State: AOAM530xSmGm3RGdgvIdAfxf4e8nc387LIxCy5IfNlQ/mJl07P18DK0h
 uR2cBJt5/WhTIUZwzoTAj+0P0NYxf6VfhPp0Bu0=
X-Google-Smtp-Source: ABdhPJwn2BYTX5/QkNEs0bR510OlVhGDCvA1jD8WEIHjWsisXpME1WyYu5aNpbTe+mRGf89UPeAHmHX4C3mi2ayVlT0=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr24171181wmb.142.1623491684384; 
 Sat, 12 Jun 2021 02:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210612003128.372238-1-leoyang.li@nxp.com>
In-Reply-To: <20210612003128.372238-1-leoyang.li@nxp.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 12 Jun 2021 11:52:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0K-S+9iHYfs-4AQZOzta6D_jH8Zy32-pfotYncBcJyDg@mail.gmail.com>
Message-ID: <CAK8P3a0K-S+9iHYfs-4AQZOzta6D_jH8Zy32-pfotYncBcJyDg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: fsl: properly remove remnant of MXC support
To: Li Yang <leoyang.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QXqoELaXY4BVUIXUX6dx+ZXn8/q4LNtBFBu0XTYB2n4d1bq/OHG
 p7zzsVFMlHFIMT3boHa/ouB931c6OvbdMXw7ulxJARchlQGN/Pm4I9MsdOFgCTOoHOeb68H
 T83+/qFbMRg+7uhO/gnVIKm9iGe4fWqF3mmP9RE3fAqZ54JwDDUJD9RL626mr45Wm7y0wmC
 I8amnEPGTtNoS8eeJhYjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f25rtUzznG8=:kl+1p+fyDrNSNW3fhHtOMI
 vyvC/WMFRbCzCxPSrdiV5RfxsXHJkOBVjHcwyJzry2EBuW/HVUSDuRHotlmTy7Hy2cWzcwbUe
 IjdgIstQJNCjxhGAZsy2TFZuU5bWpyZII1MAd/iX8oCIKxs4k28lNK+dL3B55z21hY0ok4EKa
 lTEb+Zn53D03vUegrrkeHK0wkJtB6AHcIVULTTPa6J9VSspTWkHXkkUYAr8kZqqX711UfOe6v
 YZ/kodIeQUuLgzx8lOZq/LlavI6wWaUgZhLI79z3IGOmcJx4Vy77K2hqxGYwGTStcsyuZoQRk
 hsfhkhCp+AENs2+qNSrSzJORzStt6MD6QZ4TWJ5PAeY3VK1QxXcP9XG3vETOIQkcFasJG8mXd
 qXmahNkiRU3kK7AyWC+ghK+iwYYFRZaVEehZN7NAWZTosuitT6T8C0K2ULyEttrR/EukEPslT
 Fw17Jug4XUdndYerboNf60H3jZQUkkbXIRwm9Oy/fQXBUdDETF5YbcOnYvahpkIgEuO/14JPS
 deFim3UdSi64Nyi7PLIKUA=
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Fabio Estevam <festevam@gmail.com>,
 ran.wang_1@nxp.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 12, 2021 at 2:31 AM Li Yang <leoyang.li@nxp.com> wrote:
>
> Commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> didn't remove all the MXC related stuff which can cause build problem
> for LS1021 when enabled again in Kconfig.  This patch remove all the
> remnants.
>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
