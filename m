Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599D33CDB8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 07:06:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F02qS0nHyz30JP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 17:06:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pRB9Cjv+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pRB9Cjv+; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F02q14LhJz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:06:19 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so881065pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 23:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=m1wUWomo4Lxo1+B3lTnU+y6F4eEY7QF7tsY8tQgurkc=;
 b=pRB9Cjv+FXdYmgP7PrCMggiPZjmv+Oqy3brJjW4dq60pXhkVijaJdztW6s46j7cFyn
 xgMOIWdMxYwj7/Lkj8HTTRVP1gKuRq4+lZZd5PFAgMLPRk2U99K+fT/NPIf9BCZawyjj
 ghTXMdiohzyY/IO0ZJqmJ/d4z9Tva4tFR+1DLO7ze28c6603uSXsceW0zD47YAU9Hljf
 yOKfTqcZolL+mq382+LdP3noiSGBsgenL0G1ikUFvzhUmi3DvJ9eXdT9fUNqTKI/s7X/
 VvrgMxTYVAmH0LV0QtGq5k9Hi7PmJbD4hv34SXRGoTM6PHspwPj2ayPkStCQ5I8wlDUZ
 UWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=m1wUWomo4Lxo1+B3lTnU+y6F4eEY7QF7tsY8tQgurkc=;
 b=opHg1ax7EAvoFCbICo9NX1RXtFhWoevSK6q1m1KSP+b8wlEuy4GKqMg2TcF3W19gVd
 y+HYiWZ+416kVtV70ContxdNZptqmOEOpgrnSlJuYjvcoPbVi9lXKGJpW/hRy04jJj2x
 DvaUIfl85p1C32YODcryZBwOk4a+latq6xhjTQxNhF7CRa2t6Zf7/48GVYljeiLDDNCi
 smPYrYetnEQcBAXAe4L3/eCqmZKMn7rvYeUq20bokO+Vb+eM6Fg2/cEA7L/lJHEo0KGg
 ndJoNJejMc2mS5ZGgr5NNLHY9/uUdDUZN61XjvU0jUCeHojWnGJT2DC4yBcy9RN9TyKi
 ryxg==
X-Gm-Message-State: AOAM5314z44nxV/8jrVPTa6hBDBlHu8NOV0SVC9fGRBi9Qfq+wzuhNnX
 wXMY5k9vCnj+en4aX2GouM4=
X-Google-Smtp-Source: ABdhPJz38WZUQ78MyF/vnIvl8Pfyf8K0gq4+2+c19NlbQNWJ6jUKkqkhOWUmutOgmfjvqVdh44P1Vw==
X-Received: by 2002:a17:902:e889:b029:e6:4c9:ef02 with SMTP id
 w9-20020a170902e889b02900e604c9ef02mr15075443plg.1.1615874774318; 
 Mon, 15 Mar 2021 23:06:14 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a21sm15251260pfh.31.2021.03.15.23.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 23:06:13 -0700 (PDT)
Date: Tue, 16 Mar 2021 16:06:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 00/41] KVM: PPC: Book3S: C-ify the P9 entry/exit code
To: kvm-ppc@vger.kernel.org
References: <20210305150638.2675513-1-npiggin@gmail.com>
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1615874475.4bnxc193mb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of March 6, 2021 1:05 am:
> This tidies up things, and fixes a few corner cases and unfinished
> "XXX:" bits. The major one being "bad host interrupt" detection and
> handling (taking a MCE/SRESET while switching into guest regs) which
> was missing previously from the new P9 path.
>=20
> Adds a few new patches and makes some changes for issues noticed
> by reviewers (thank you).

I've put a tree up here with latest changes.

https://github.com/npiggin/linux/tree/kvm-in-c

Should include all the review comments from this thread so far, no
other major changes.

I'll hold off posting out another series probably at least until
powerpc next solidifies a bit more (some of the interrupt handler
changes pending there might clash).

Thanks,
Nick
