Return-Path: <linuxppc-dev+bounces-11318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05967B35A59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 12:47:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB49G6lvVz3dSf;
	Tue, 26 Aug 2025 20:46:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756205218;
	cv=none; b=Pqdiub+uMaoX0By8LSN3x23dattmNaZJoi3s6gmkI1+CaN0KG84VdMwdOYnOO5iQjA4xgNwtQTTIbFJEJwLtSoYXz0N0ZX7oWjBGmuN3mrNoa8Z1ePDYs3Utf/yE7A4RkiraVc+BOWaTNrke5O3XNBqSNCILJLHV+cZDpMsb/I69F1VogaTV7diaxi7yfZoehw7YEr8pe+wRyXnQLY/cXBij39TSBrda8X04/YXSRzmSdjUszXuK2/5fm+jGfdWGRKQlW7RkiohpDYEg+DD2vWV/FV1bpaH/C1S8wdKtbWnfx9KrrHLCUrZxkR1ol1WN98cy0gfbuder1cI4EWCUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756205218; c=relaxed/relaxed;
	bh=gdFNtHsx4p4jHUN4DEBrqawUgZaapILcujoHDXNs4Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MycUvmvTbu3WoJPRdeGeJF4D3R4KIFTtQurTqp5Glw1wpCLgYHb4vsGam8+h0cLOQSw02ee+KaUdWsF8no/igBsIkC6CSMcAWfhuwGboAovy256U4Oy8Jsfol8hFfiWt/et3jIni8G4Z4GRBl0i2SanfwE4vEIAXLoGMjuvHQlDu9ds6o5CFEbYQH77q5/1QW+suJH8imT3vWno278pz9BdcPsf1jRFY/XOmyZQR4gj7BnFQ1jN/388cYJyD4qy63E4KarzZdEmx/kdQGidSkpWNO9UPZtOaWVNTVPxlipzUWf86P1GIT54e34msjVlWWMuXHccln6d9nGr/GJgCxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB49F5cRqz3dRS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 20:46:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A06821A25;
	Tue, 26 Aug 2025 03:46:15 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8000D3F694;
	Tue, 26 Aug 2025 03:46:14 -0700 (PDT)
Date: Tue, 26 Aug 2025 11:46:10 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	acme@kernel.org, namhyung@kernel.org,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 01/19] perf/arm-cmn: Fix event validation
Message-ID: <aK2QclH4jlHJ28EJ@J2N7QTR9R3>
References: <cover.1755096883.git.robin.murphy@arm.com>
 <0716da3e77065f005ef6ea0d10ddf67fc53e76cb.1755096883.git.robin.murphy@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0716da3e77065f005ef6ea0d10ddf67fc53e76cb.1755096883.git.robin.murphy@arm.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Robin,

On Wed, Aug 13, 2025 at 06:00:53PM +0100, Robin Murphy wrote:
> In the hypothetical case where a CMN event is opened with a software
> group leader that already has some other hardware sibling, currently
> arm_cmn_val_add_event() could try to interpret the other event's data
> as an arm_cmn_hw_event, which is not great since we dereference a
> pointer from there... Thankfully the way to be more robust is to be
> less clever - stop trying to special-case software events and simply
> skip any event that isn't for our PMU.

I think this is missing some important context w.r.t. how the core perf
code behaves (and hence why this change doesn't cause other problems).
I'd suggest that we give the first few patches a common preamble:

| When opening a new perf event, the core perf code calls
| pmu::event_init() before checking whether the new event would cause an
| event group to span multiple hardware PMUs. Considering this:
| 
| (1) Any pmu::event_init() callback needs to be robust to cases where
|     a non-software group_leader or sibling event targets a distinct
|     PMU.
| 
| (2) Any pmu::event_init() callback doesn't need to explicitly reject
|     groups that span multiple hardware PMUs, as the core code will
|     reject this later.

... and then spell out the specific issues in the driver, e.g.

| The logic in arm_cmn_validate_group() doesn't account for cases where
| a non-software sibling event targets a distinct PMU. In such cases,
| arm_cmn_val_add_event() will erroneously interpret the sibling's
| event::hw as as struct arm_cmn_hw_event, including dereferencing
| pointers from potentially user-controlled fields.
|
| Fix this by skipping any events for distinct PMUs, and leaving it to
| the core code to reject event groups that span multiple hardware PMUs.

With that context, the patch itself looks good to me.

This will need a Cc stable. I'm not sure what Fixes tag is necessary;
has this been broken since its introduction?

Mark.

> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/perf/arm-cmn.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 11fb2234b10f..f8c9be9fa6c0 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -1652,7 +1652,7 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
>  	enum cmn_node_type type;
>  	int i;
>  
> -	if (is_software_event(event))
> +	if (event->pmu != &cmn->pmu)
>  		return;
>  
>  	type = CMN_EVENT_TYPE(event);
> @@ -1693,9 +1693,6 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
>  	if (leader == event)
>  		return 0;
>  
> -	if (event->pmu != leader->pmu && !is_software_event(leader))
> -		return -EINVAL;
> -
>  	val = kzalloc(sizeof(*val), GFP_KERNEL);
>  	if (!val)
>  		return -ENOMEM;
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

