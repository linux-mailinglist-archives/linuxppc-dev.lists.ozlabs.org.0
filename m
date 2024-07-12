Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D558A930192
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 23:26:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kVaddDwa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLPmb5tqbz3cVy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2024 07:26:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kVaddDwa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLPlr5TVtz3bvP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2024 07:26:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 297736201C;
	Fri, 12 Jul 2024 21:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588E3C32782;
	Fri, 12 Jul 2024 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720819557;
	bh=TJOTVL8Qfjld2mG1BrVlr/IK8zvwxsJT6xvBzh3OQ/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVaddDwayhtho980xcTLCPM+IcoipB/HxJc34yFg49mOhSljtR+h1kGgMkjuVqOlG
	 /azB/8GRDZ6SBvvhplfAAwk2PUciRUmDkkOOhQPQV/G+mUMGDQiYot3fxM0HiG18rv
	 U0u4yaDaAQf8DAuQkN0KtyKgtvoRIOjxbH1nmEXlLwJ69Ifkmqoa31XS5HYF5P0vwv
	 CmYuEJKkTNpj4r1ArVuuXHWg91hk/ot7iZk/+eoFOqzTd8AbbDr9WWV5zYJQUS0qI1
	 l+gsJgkWYBRxinOhE9aX5n5cwszSGlUfTueG7p25O60sDL9VykDmLwbLnrjZYfI+AI
	 uloarlLX0IMow==
Date: Fri, 12 Jul 2024 16:25:53 -0500
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V6 17/18] tools/perf: Update data_type_cmp and
 sort__typeoff_sort function to include var_name in comparison
Message-ID: <ZpGfYVc_ewcsQxWL@google.com>
References: <20240707144419.92510-1-atrajeev@linux.vnet.ibm.com>
 <20240707144419.92510-18-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240707144419.92510-18-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, acme@kernel.org, jolsa@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 07, 2024 at 08:14:18PM +0530, Athira Rajeev wrote:
> Currently data_type_cmp() only compares size and type name.
> But in cases where the type name of two data type entries
> is same, but var_name is different, the comparison can't distinguish
> two different types.
> 
> Consider there is a "long unsigned int" with var_name as "X" and there
> is global variable "long unsigned int". Currently since
> data_type_cmp uses only type_name for comparison ( "long unsigned int"),
> it won't distinguish these as separate entries. Update the

I'm still not sure if it's ok.  It intentionally merges different
instances of the same type together as it's a data 'type' profile.


> functions "data_type_cmp" as well as "sort__typeoff_sort" to
> compare variable names after type name if it exists.
> 
> Also updated "hist_entry__typeoff_snprintf" to print var_name if
> it is set. With the changes,
> 
>      11.42%  long unsigned int  long unsigned int +0 (current_stack_pointer)
>      4.68%  struct paca_struct  struct paca_struct +2312 (__current)
>      4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
>      2.69%  struct paca_struct  struct paca_struct +2808 (canary)
>      2.68%  struct paca_struct  struct paca_struct +8 (paca_index)
>      2.24%  struct paca_struct  struct paca_struct +48 (data_offset)
>      1.43%  long unsigned int  long unsigned int +0 (no field)

It seems like an output of `perf report -s type,typeoff`.  But I'm
curious how it'd work with -s type only?  I guess it'd have two separate
entries for 'long unsigned int'.  Ideally we can have a single entry
with two different fields.

For example, `perf report -s type,typeoff -H`:

  12.85%     long unsigned int
     11.42%     long unsigned int +0 (current_stack_pointer)
      1.43%     long unsigned int +0 (no field)
  ...

> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/annotate-data.c | 24 ++++++++++++++++++++++--
>  tools/perf/util/sort.c          | 23 +++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
> index 8d05f3dbddf6..759c6a22e719 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -167,7 +167,7 @@ static void exit_type_state(struct type_state *state)
>  }
>  
>  /*
> - * Compare type name and size to maintain them in a tree.
> + * Compare type name, var_name  and size to maintain them in a tree.
>   * I'm not sure if DWARF would have information of a single type in many
>   * different places (compilation units).  If not, it could compare the
>   * offset of the type entry in the .debug_info section.
> @@ -176,12 +176,32 @@ static int data_type_cmp(const void *_key, const struct rb_node *node)
>  {
>  	const struct annotated_data_type *key = _key;
>  	struct annotated_data_type *type;
> +	int64_t ret = 0;
>  
>  	type = rb_entry(node, struct annotated_data_type, node);
>  
>  	if (key->self.size != type->self.size)
>  		return key->self.size - type->self.size;
> -	return strcmp(key->self.type_name, type->self.type_name);
> +
> +	ret = strcmp(key->self.type_name, type->self.type_name);
> +	if (ret) {
> +		return ret;
> +	}

No need for the parentheses.

> +
> +	/*
> +	 * Compare var_name if it exists for key and type.
> +	 * If both nodes doesn't have var_name, but one of
> +	 * them has, return non-zero. This is to indicate nodes
> +	 * are not the same if one has var_name, but other doesn't.
> +	 */
> +	if (key->self.var_name && type->self.var_name) {
> +		ret = strcmp(key->self.var_name, type->self.var_name);
> +		if (ret)
> +			return ret;
> +	} else if (key->self.var_name || type->self.var_name)
> +		return 1;

I think you need to compare the order properly like in cmp_null() in
util/sort.c.  Please see below.

> +
> +	return ret;
>  }
>  
>  static bool data_type_less(struct rb_node *node_a, const struct rb_node *node_b)
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index cd39ea972193..c6d885060ee7 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -2267,9 +2267,25 @@ sort__typeoff_sort(struct hist_entry *left, struct hist_entry *right)
>  		right_type = right->mem_type;
>  	}
>  
> +	/*
> +	 * Compare type_name first. Next, ompare var_name if it exists
> +	 * for left and right hist_entry. If both entries doesn't have
> +	 * var_name, but one of them has, return non-zero. This is to
> +	 * indicate entries are not the same if one has var_name, but the
> +	 * other doesn't.
> +	 * If type_name and var_name is same, use mem_type_off field.
> +	 */
>  	ret = strcmp(left_type->self.type_name, right_type->self.type_name);
>  	if (ret)
>  		return ret;
> +
> +	if (left_type->self.var_name && right_type->self.var_name) {
> +		ret = strcmp(left_type->self.var_name, right_type->self.var_name);
> +		if (ret)
> +			return ret;
> +	} else if (right_type->self.var_name || left_type->self.var_name)
> +		return 1;

	} else if (!left_type->self.var_name != !right_type->self.var_name)
		return cmp_null(left_type->self.var_name, right_type->self.var_name);

Thanks,
Namhyung

> +
>  	return left->mem_type_off - right->mem_type_off;
>  }
>  
> @@ -2305,9 +2321,12 @@ static int hist_entry__typeoff_snprintf(struct hist_entry *he, char *bf,
>  	char buf[4096];
>  
>  	buf[0] = '\0';
> -	if (list_empty(&he_type->self.children))
> +	if (list_empty(&he_type->self.children)) {
>  		snprintf(buf, sizeof(buf), "no field");
> -	else
> +		if (he_type->self.var_name)
> +			strcpy(buf, he_type->self.var_name);
> +
> +	} else
>  		fill_member_name(buf, sizeof(buf), &he_type->self,
>  				 he->mem_type_off, true);
>  	buf[4095] = '\0';
> -- 
> 2.43.0
> 
