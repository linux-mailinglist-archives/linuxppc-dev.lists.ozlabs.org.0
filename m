Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B34D2B60
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 10:06:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD5sS2Ynfz3bVP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:06:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=JlVkLfQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD5rp5hr4z30LR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=JlVkLfQ9; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4KD5rl1WZ6z4xvJ; Wed,  9 Mar 2022 20:05:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1646816743;
 bh=2T185+CM5zT+UIvWa5+XhJAAAEtv7RH9ZWvqTwtU+mc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JlVkLfQ9DbssAt8xQ4O1pJCG8OwtSn0FY9oCqLyiSH/EvOH8uCFsvR8p2RbIkeJXR
 HfYSy2kVE6++P5SWCqXSsR+Rd7ALsoi16h72zAYmz2zooRG/P6VJxiwpXYESOPWdKJ
 CbRPWSiK/iJTTMDvrPwzMsDsFYR2gTJyxTQSrR6TB4IYCzXD66aqKUV+b6nmHsnfQk
 IWl/qXLRVznmC9LyTwa8rxekeEcUHZZKe8gncg3sWThUo0cTw3trzOmrnB/fu3Uq3U
 Ofrovaod7P0tdWQQk86ylAEOfcwlKjXWj8DWIUCSbpZA9JdHczwZFnpvVXKDc2oakQ
 MFM1Y3j5fT/eA==
Date: Wed, 9 Mar 2022 09:05:24 +0000
From: Paul Mackerras <paulus@ozlabs.org>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH] KVM: PPC: Book3S HV: Add KVM_CAP_PPC_GTSE
Message-ID: <Yiht1OBSvh4SK9vY@cleo>
References: <20220309012338.2527143-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309012338.2527143-1-farosas@linux.ibm.com>
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
Cc: aneesh.kumar@linux.ibm.com, danielhb413@gmail.com, npiggin@gmail.com,
 clg@kaod.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 08, 2022 at 10:23:38PM -0300, Fabiano Rosas wrote:
> This patch adds a new KVM capability to address a crash we're
> currently having inside the nested guest kernel when running with
> GTSE disabled in the nested hypervisor.

I think the patch needs to add a description of KVM_CAP_PPC_GTSE to
Documentation/virt/kvm/api.rst.

Regards,
Paul.
