Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B213730F1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZVY23yJVz30DQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:39:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aXymTqrJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aXymTqrJ; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZVXZ0Vsrz2yqC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:39:24 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id h4so10611256wrt.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 12:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GDyWX0q7nbyvuzEr5U4jc0HN+67Caz0FfP8gT+cK9CI=;
 b=aXymTqrJX5ndGEh0jKK+icbf6rvTAkZPknIFPTjoPU+LsKPY8wmIKr47uiQnvw6UQV
 jXairnmn44SEEtETHV/uZnWM9Dl3l6n+ePHgNKiBrppVAESTIYpze3ntxzhxvRGIGm+F
 u6p0Lu9BTl2jbtXZFrD5r8SeM/eR1YK18voshYYsE6jSkXEhQK3X0tGsOnVb0/LaFnAD
 xD4N+w0cZQTpW3NePqfbuQdo1KZKZb02upMjK5GvHyqMlRMZkmLeHkQQbCo30PVRJhSh
 BPjaaXct+fz0P6hvbok9UM5ehZ0bjnItABBzjLTyH9Lz6i+sv2EjHKDJPpZZjOh+bDpv
 fzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GDyWX0q7nbyvuzEr5U4jc0HN+67Caz0FfP8gT+cK9CI=;
 b=iIQPGxtlR2rXaas5TtvZt1tMovrjkd85KFeK4Y4b4LP+l8HUfD+vhyM1NK/ZQ2SHp/
 61rSiQAdJsHdsUmuIuaPnD5ogtm8L6uAH31C8PlScM/Iyto981nRfEggbS0Q2VuXkL7u
 fdgYFEngrFQL46z7Yp2Y1e5sukwGuNQsbVkQSyLiXKItQDTk9NCgtduNck86Cl+xgQDM
 AUDm5FQfym8nN/Blzc01dFDQsXsxjFpDHhWx4AwF2+C5s9Y8QSh9jNKkwl5R0gfAEtSn
 gqaJiCk/pNu6ExdjXlQECEXfkdan3xzjDEYq9JjPyVTklM8qTc33Tfrgw7cmzo454wVD
 zO3g==
X-Gm-Message-State: AOAM531k7pdDlSB4n7CCDdFJZG71LTchXhgK0koxiuiSS3nUpp6D4AHq
 jzvh1NZK7UfHPTZJO6hfnohv5T8uZp8VmwVPFr8=
X-Google-Smtp-Source: ABdhPJzw2M+VQweZcHVDuN3fz4HlHtVDrzhc2eQ7ho9FCcN3ovlIwvTDxuYgzfaiq5WPRRTPy50crSd9zLqC72Yz7PM=
X-Received: by 2002:adf:ed43:: with SMTP id u3mr27027448wro.334.1620157160659; 
 Tue, 04 May 2021 12:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210503.134721.2149322673805635760.davem@davemloft.net>
 <20210504191923.32313-1-msuchanek@suse.de>
In-Reply-To: <20210504191923.32313-1-msuchanek@suse.de>
From: Lijun Pan <lijunp213@gmail.com>
Date: Tue, 4 May 2021 14:39:10 -0500
Message-ID: <CAOhMmr4tYOuTVNquU5oZ=1G7vVR4mz+5q8Gb8Zy96PBioLPnUA@mail.gmail.com>
Subject: Re: [PATCH v2 net-next resend] ibmvnic: remove default label from
 to_string switch
To: Michal Suchanek <msuchanek@suse.de>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 2:19 PM Michal Suchanek <msuchanek@suse.de> wrote:
>
> This way the compiler warns when a new value is added to the enum but
> not to the string translation like:
>
> drivers/net/ethernet/ibm/ibmvnic.c: In function 'adapter_state_to_string':
> drivers/net/ethernet/ibm/ibmvnic.c:832:2: warning: enumeration value 'VNIC_FOOBAR' not handled in switch [-Wswitch]
>   switch (state) {
>   ^~~~~~
> drivers/net/ethernet/ibm/ibmvnic.c: In function 'reset_reason_to_string':
> drivers/net/ethernet/ibm/ibmvnic.c:1935:2: warning: enumeration value 'VNIC_RESET_FOOBAR' not handled in switch [-Wswitch]
>   switch (reason) {
>   ^~~~~~
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> Acked-by: Lijun Pan <lijunp213@gmail.com>
> ---
> v2: Fix typo in commit message
> ---

Hi Michal,

Thank you for reposting the patch and including the Ack-by tag. I
think you need to wait till next Tuesday or so when net-next reopens,
then you can repost the patch.
http://vger.kernel.org/~davem/net-next.html.

Thanks,
Lijun
