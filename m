Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684435420B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 14:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDVSq2llFz3bsB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 22:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AjR104et;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=avagin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AjR104et; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDJFW4rLkz2yxN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 14:53:19 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id t24so1396748pjw.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 21:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZCE8DXq6AXOhvGcnEbPdIGiWxGR0DNPB4En9zD417Mo=;
 b=AjR104ethb/rIHzSnVpqVgi6EsTCzJaaUxnLpilWzQbcoMJU/+9r0Z9QHCdn842aO9
 agRr0cv9hjGTOhgosz26MQTAtZBwKLcvl0/7TkCsMnauaLGbmBS9EkD+SfteNM6H9huV
 c3uylhufMbXhGp6wnqw23rb6O3v4/+/gsrGBqbRHvHv40zCUbw9mTB/aT35baR6+SAUL
 dyiKy4friYGOoIxeN6pAwk/wVbwrvwFAwxD5B39n/Wz8aS7nvnSbmxahArC1dKFbdmUg
 l0aoUQxOsWkhvHwfrHeku6rWzWHCw3yr8/q4Oe6vqfCDHrEwoFPB83ECQVsc4mDQsX5r
 FewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZCE8DXq6AXOhvGcnEbPdIGiWxGR0DNPB4En9zD417Mo=;
 b=GwaWRcvRiLhg6AlBrmIJ02L+xIXWVtqUuOVuRYwRn/eYZjgEpogXNIPxECUncZQyvP
 zP4P/Nm+TZdhIh1Is9uxExPORps7rwXjIPaLSXistgg8M/bkqCYUATYYLQysR7EDizg0
 J+a30Eu/UblY0vlQK5RuzIIrlS+nSlGwetT5w99OY0w0KnZv69fG9K+koVxsljokNHdm
 ecsTUlnBwx4GLs8CYvN97O1gv2rPcwMaBaocy1Q3ooRCWShpTd2MnoDc2+3m3S9wqjMd
 CWDac1znfbONYIu2+QRV+A9Cd5ZjDVOoM/pHgkB2AIZQzAGrDNmSA2yci4ozOVRWsUlQ
 Jtug==
X-Gm-Message-State: AOAM5306eJBzr1M3Xi5F8EHj2NClAqFqgxhEKik+EaTsAp+aQZfWZWKi
 61ytCWzfjpxXqeqWDQjxui0=
X-Google-Smtp-Source: ABdhPJzfg2ojOFwwEAtuSC96RYvGRpvmKRNH0XexWPQ2Qhe5nU1HK9MGimRyUq/fHwj0Fqunx6onqA==
X-Received: by 2002:a17:90a:a108:: with SMTP id
 s8mr24898984pjp.199.1617598397085; 
 Sun, 04 Apr 2021 21:53:17 -0700 (PDT)
Received: from gmail.com ([2601:600:8500:5f14:d627:c51e:516e:a105])
 by smtp.gmail.com with ESMTPSA id gm10sm14102358pjb.4.2021.04.04.21.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 21:53:16 -0700 (PDT)
Date: Sun, 4 Apr 2021 21:50:50 -0700
From: Andrei Vagin <avagin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH RESEND v1 4/4] powerpc/vdso: Add support for time
 namespaces
Message-ID: <YGqXKkLDwDb589Qg@gmail.com>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
 <1a15495f80ec19a87b16cf874dbf7c3fa5ec40fe.1617209142.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <1a15495f80ec19a87b16cf874dbf7c3fa5ec40fe.1617209142.git.christophe.leroy@csgroup.eu>
X-Mailman-Approved-At: Mon, 05 Apr 2021 22:33:24 +1000
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31, 2021 at 04:48:47PM +0000, Christophe Leroy wrote:
> This patch adds the necessary glue to provide time namespaces.
> 
> Things are mainly copied from ARM64.
> 
> __arch_get_timens_vdso_data() calculates timens vdso data position
> based on the vdso data position, knowing it is the next page in vvar.
> This avoids having to redo the mflr/bcl/mflr/mtlr dance to locate
> the page relative to running code position.
>

Acked-by: Andrei Vagin <avagin@gmail.com>
 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
