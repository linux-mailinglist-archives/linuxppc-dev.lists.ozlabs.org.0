Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853101ED8ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 01:06:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cl081XBqzDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 09:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.56; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0056.hostedemail.com
 [216.40.44.56])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cky00FZ1zDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 09:04:37 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 45F56837F24D;
 Wed,  3 Jun 2020 23:04:34 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3867:3868:3870:3871:4321:4605:5007:6119:6691:7974:8603:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12555:12663:12740:12760:12895:12986:13019:13439:14093:14097:14181:14659:14721:21080:21325:21433:21451:21627:30012:30045:30054:30089:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: basin86_280ffd426d92
X-Filterd-Recvd-Size: 3564
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Wed,  3 Jun 2020 23:04:32 +0000 (UTC)
Message-ID: <b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com>
Subject: Re: [PATCH] pwm: Add missing "CONFIG_" prefix
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>
Date: Wed, 03 Jun 2020 16:04:31 -0700
In-Reply-To: <202006031539.4198EA6@keescook>
References: <202006031539.4198EA6@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-06-03 at 15:40 -0700, Kees Cook wrote:
> The IS_ENABLED() use was missing the CONFIG_ prefix which would have
> lead to skipping this code.
> 
> Fixes: 3ad1f3a33286 ("pwm: Implement some checks for lowlevel drivers")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/pwm/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 9973c442b455..6b3cbc0490c6 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -121,7 +121,7 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
>  		pwm->chip->ops->get_state(pwm->chip, pwm, &pwm->state);
>  		trace_pwm_get(pwm, &pwm->state);
>  
> -		if (IS_ENABLED(PWM_DEBUG))
> +		if (IS_ENABLED(CONFIG_PWM_DEBUG))
>  			pwm->last = pwm->state;
>  	}
>  
> -- 
> 2.25.1
> 

more odd uses (mostly in comments)

$ git grep -P -oh '\bIS_ENABLED\s*\(\s*\w+\s*\)'| \
  sed -r 's/\s+//g'| \
  grep -v '(CONFIG_' | \
  sort | uniq -c | sort -rn
      7 IS_ENABLED(DEBUG)
      4 IS_ENABLED(DRM_I915_SELFTEST)
      4 IS_ENABLED(cfg)
      2 IS_ENABLED(opt_name)
      2 IS_ENABLED(DEBUG_PRINT_TRIE_GRAPHVIZ)
      2 IS_ENABLED(config)
      2 IS_ENABLED(cond)
      2 IS_ENABLED(__BIG_ENDIAN)
      1 IS_ENABLED(x)
      1 IS_ENABLED(STRICT_KERNEL_RWX)
      1 IS_ENABLED(PWM_DEBUG)
      1 IS_ENABLED(option)
      1 IS_ENABLED(ETHTOOL_NETLINK)
      1 IS_ENABLED(DEBUG_RANDOM_TRIE)
      1 IS_ENABLED(DEBUG_CHACHA20POLY1305_SLOW_CHUNK_TEST)

STRICT_KERNEL_RWX is misused here in ppc

---

Fix pr_warn without newline too.

 arch/powerpc/mm/book3s64/hash_utils.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 51e3c15f7aff..dd60c5f2b991 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -660,11 +660,10 @@ static void __init htab_init_page_sizes(void)
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
 		 */
-		if (IS_ENABLED(STRICT_KERNEL_RWX) &&
+		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
 		    (unsigned long)_stext % 0x1000000) {
 			if (mmu_psize_defs[MMU_PAGE_16M].shift)
-				pr_warn("Kernel not 16M aligned, "
-					"disabling 16M linear map alignment");
+				pr_warn("Kernel not 16M aligned, disabling 16M linear map alignment\n");
 			aligned = false;
 		}
 



