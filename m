Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67AD6BBA2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 17:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcGbL5Cx3z3f8t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 03:50:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IARnD03W;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IARnD03W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IARnD03W;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IARnD03W;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcGYS6Lg3z3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 03:48:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678898905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jN7gBsIIz2o+DPuOLs3beGrkWCBpTBuHN9nwm3qigXs=;
	b=IARnD03WVmI1sLxO6H0lZGc0Pp0cBFfQFjLnGAYg3rcL2GReL/JWnfYMBJPs+mrG5DyU0G
	ioNwBDG+LRkMcz9bqlYl4x1xPSZt3V82A758/JgfUmALE31yATtgiTOAUdQx/X+vsPjylv
	lKjHAq6SJupzSuQJDlP6y98WgJI+wkA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678898905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jN7gBsIIz2o+DPuOLs3beGrkWCBpTBuHN9nwm3qigXs=;
	b=IARnD03WVmI1sLxO6H0lZGc0Pp0cBFfQFjLnGAYg3rcL2GReL/JWnfYMBJPs+mrG5DyU0G
	ioNwBDG+LRkMcz9bqlYl4x1xPSZt3V82A758/JgfUmALE31yATtgiTOAUdQx/X+vsPjylv
	lKjHAq6SJupzSuQJDlP6y98WgJI+wkA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-gkXQa7U6MU-jBbLk1DhYsA-1; Wed, 15 Mar 2023 12:48:21 -0400
X-MC-Unique: gkXQa7U6MU-jBbLk1DhYsA-1
Received: by mail-wm1-f69.google.com with SMTP id l17-20020a05600c1d1100b003ed29ba093cso977402wms.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 09:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678898900;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jN7gBsIIz2o+DPuOLs3beGrkWCBpTBuHN9nwm3qigXs=;
        b=MHGaJ2TNMpjhBYNZ3TcyR7fmx5VfJ+RuY3/uWGc09xA83qmHkMt+qYGTC3dVBMhimc
         wMdP3bCrAOaemxcmCzSzK6QxnAnOlsnGSw7CHJXQwUFPmitBfX+VOpqQPuH3U22eg2RL
         hds1c2RtsURHmTGUUfy32ZLjk8g6RmhvpbqrGCOHOu2l2yqL5DV3271LdJkdPHJSlfZm
         B04AbReN2sUk36TlxG3OYfT2d65EojTOj2IRvMjvkshosBxc4lRFU1/MvtYsfp25oheD
         Q9Ez9ydrvFSTMI84d8x0wTGuAWbnJTiSyThR8AtXRCPa/YvReH+n6L0Y8kftpAXomip5
         z1Pg==
X-Gm-Message-State: AO0yUKUfjbK+uICNQDc/zF/FHD8/3907iJsZc1Mr9QgKfdwijTrtrku1
	JrlI9LFp8BJgUZ+7PvsXnAos6M9gCESefE8FUF05bKeb7ktlN/fPxl/ej53taOyzN6lq433H9Il
	OyhQCzY19Qj7Xsqr1rM6avmExjQ==
X-Received: by 2002:a5d:5090:0:b0:2ce:a8d6:5427 with SMTP id a16-20020a5d5090000000b002cea8d65427mr2284845wrt.15.1678898900832;
        Wed, 15 Mar 2023 09:48:20 -0700 (PDT)
X-Google-Smtp-Source: AK7set/7yCT9DzLtDjuAkonvARDw7EiuzZU1jup24r5YSYMqq3/If+0deo0/FhmbO4gSj7aLlCTntw==
X-Received: by 2002:a5d:5090:0:b0:2ce:a8d6:5427 with SMTP id a16-20020a5d5090000000b002cea8d65427mr2284831wrt.15.1678898900561;
        Wed, 15 Mar 2023 09:48:20 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d508b000000b002c55b0e6ef1sm5210847wrt.4.2023.03.15.09.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:48:19 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Yury Norov <yury.norov@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] powerpc: use node_has_cpus() instead of nr_cpus_node()
In-Reply-To: <20230222025029.453834-2-yury.norov@gmail.com>
References: <20230222025029.453834-1-yury.norov@gmail.com>
 <20230222025029.453834-2-yury.norov@gmail.com>
Date: Wed, 15 Mar 2023 16:48:17 +0000
Message-ID: <xhsmha60em04u.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Barry Song <baohua@kernel.org>, Yury Norov <yury.norov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/02/23 18:50, Yury Norov wrote:
> Use node_has_cpus() as more efficient alternative to nr_cpus_node()
> where possible.
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

