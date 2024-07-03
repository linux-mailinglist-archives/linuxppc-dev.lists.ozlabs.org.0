Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFDD924D67
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 04:01:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tdceNgMQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDNL512lSz3cZ4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:01:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tdceNgMQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDNKP0trWz30TK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 12:00:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4AEACE2201;
	Wed,  3 Jul 2024 02:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81802C116B1;
	Wed,  3 Jul 2024 02:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719972038;
	bh=PBS/IZZg00mOz6DJKccmHVP3hwHiuKcrdM2hpmKjJg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdceNgMQ7s3P+PXRA7B19VLQUFYno2o2f9pwJEyK+5MseaOUdj6QRPh7SsLnVg+IG
	 +qMyXrxBrOIHZFMRFTt8M2661XpaiiMj1v1NDDY6frkXaP5d22GTPsOT3YJHl/HJO4
	 nEJ+LXbZgPeTo6pnGWiXTw4ZmHQo6u6KKPcFrNwYcgV0vK+zgPMy70dJFAB5c1p5Ah
	 ZWeW08IFowoXrsatwMIWhu+pccx+NXNxKZ8WQkUrXkN69iqaVJrfthTiNdd9hUOrFe
	 490fgy6skY5nGAzrNkDoMcvwBjz6W7niZlHK+Nqs7rZ6s21ahUXHIFgIq/OQLaVb8x
	 Jzva+UVHHPRzw==
Date: Tue, 2 Jul 2024 19:00:36 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V5 16/17] tools/perf: Add support for global_die to
 capture name of variable in case of register defined variable
Message-ID: <ZoSwxHC3cpGa1UqM@google.com>
References: <20240701043430.66666-1-atrajeev@linux.vnet.ibm.com>
 <20240701043430.66666-17-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240701043430.66666-17-atrajeev@linux.vnet.ibm.com>
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

On Mon, Jul 01, 2024 at 10:04:29AM +0530, Athira Rajeev wrote:
> In case of register defined variable (found using
> find_data_type_global_reg), if the type of variable happens to be base
> type (example, long unsigned int), perf report captures it as:
> 
>     12.85%  long unsigned int  long unsigned int +0 (no field)
> 
> The above data type is actually referring to samples captured while
> accessing "r1" which represents current stack pointer in powerpc.
> register void *__stack_pointer asm("r1");
> 
> The dwarf debug contains this as:
> 
> <<>>
>  <1><18dd772>: Abbrev Number: 129 (DW_TAG_variable)
>     <18dd774>   DW_AT_name        : (indirect string, offset: 0x11ba): current_stack_pointer
>     <18dd778>   DW_AT_decl_file   : 51
>     <18dd779>   DW_AT_decl_line   : 1468
>     <18dd77b>   DW_AT_decl_column : 24
>     <18dd77c>   DW_AT_type        : <0x18da5cd>
>     <18dd780>   DW_AT_external    : 1
>     <18dd780>   DW_AT_location    : 1 byte block: 51    (DW_OP_reg1 (r1))
> 
>  where 18da5cd is:
> 
>  <1><18da5cd>: Abbrev Number: 47 (DW_TAG_base_type)
>     <18da5ce>   DW_AT_byte_size   : 8
>     <18da5cf>   DW_AT_encoding    : 7   (unsigned)
>     <18da5d0>   DW_AT_name        : (indirect string, offset: 0x55c7): long unsigned int
> <<>>
> 
> To make it more clear to the user, capture the DW_AT_name of the
> variable and save it as part of Dwarf_Global. Dwarf_Global is used so
> that it can be used and retrieved while presenting the result.
> 
> Update "dso__findnew_data_type" function to set "var_name" if
> variable name is set as part of Dwarf_Global. Updated
> "hist_entry__typeoff_snprintf" to print var_name if it is set.
> With the changes, along with "long unsigned int" report also says the
> variable name as current_stack_pointer
> 
> Snippet of result:
> 
>     12.85%  long unsigned int  long unsigned int +0 (current_stack_pointer)

But I'm afraid it'd contain other (global) unsigned int type accesses
also.  Currently data_type_cmp() only compares size and type name so it
cannot distinguish two different int variables.

I thought it's ok since we care about types, but we might want to see
global variables (in the same type) - not only register variables -
separately.  Then I think we should compare variable names after type
name (if exists).


>      4.68%  struct paca_struct  struct paca_struct +2312 (__current)
>      4.57%  struct paca_struct  struct paca_struct +2354 (irq_soft_mask)
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/annotate-data.c | 30 ++++++++++++++++++++++++------
>  tools/perf/util/dwarf-aux.c     |  1 +
>  tools/perf/util/dwarf-aux.h     |  1 +
>  tools/perf/util/sort.c          |  7 +++++--
>  4 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/perf/util/annotate-data.c b/tools/perf/util/annotate-data.c
> index c919b2259f54..a6d6cf69dbab 100644
> --- a/tools/perf/util/annotate-data.c
> +++ b/tools/perf/util/annotate-data.c
> @@ -273,23 +273,32 @@ static void delete_members(struct annotated_member *member)
>  }
>  
>  static struct annotated_data_type *dso__findnew_data_type(struct dso *dso,
> -							  Dwarf_Die *type_die)
> +							  Dwarf_Die *type_die, Dwarf_Global *global_die)
>  {
>  	struct annotated_data_type *result = NULL;
>  	struct annotated_data_type key;
>  	struct rb_node *node;
>  	struct strbuf sb;
> +	struct strbuf sb_var_name;
>  	char *type_name;
> +	char *var_name = NULL;
>  	Dwarf_Word size;
>  
>  	strbuf_init(&sb, 32);
> +	strbuf_init(&sb_var_name, 32);
>  	if (die_get_typename_from_type(type_die, &sb) < 0)
>  		strbuf_add(&sb, "(unknown type)", 14);
> +	if (global_die->name) {
> +		strbuf_addstr(&sb_var_name, global_die->name);
> +		var_name = strbuf_detach(&sb_var_name, NULL);
> +	}
>  	type_name = strbuf_detach(&sb, NULL);
>  	dwarf_aggregate_size(type_die, &size);
>  
>  	/* Check existing nodes in dso->data_types tree */
>  	key.self.type_name = type_name;
> +	if (global_die->name)
> +		key.self.var_name = var_name;

Maybe you can set it unconditionally as it's NULL by default.
But you need to free the var_name if rb_find() returns an existing
node.  I think it should be done after you allocate the result.


>  	key.self.size = size;
>  	node = rb_find(&key, dso__data_types(dso), data_type_cmp);
>  	if (node) {
> @@ -306,6 +315,8 @@ static struct annotated_data_type *dso__findnew_data_type(struct dso *dso,
>  	}
>  
>  	result->self.type_name = type_name;
> +	if (global_die->name)
> +		result->self.var_name = var_name;

Here.

Thanks,
Namhyung


>  	result->self.size = size;
>  	INIT_LIST_HEAD(&result->self.children);
>  
> @@ -1183,7 +1194,7 @@ static int find_data_type_block(struct data_loc_info *dloc,
>   * cu_die and match with reg to identify data type die.
>   */
>  static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_Die *cu_die,
> -		Dwarf_Die *type_die)
> +		Dwarf_Die *type_die, Dwarf_Global *global_die)
>  {
>  	Dwarf_Die vr_die;
>  	int ret = -1;
> @@ -1195,8 +1206,11 @@ static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_
>  			if (dwarf_offdie(dloc->di->dbg, var_types->die_off, &vr_die)) {
>  				if (die_get_real_type(&vr_die, type_die) == NULL) {
>  					dloc->type_offset = 0;
> +					global_die->name = var_types->name;
>  					dwarf_offdie(dloc->di->dbg, var_types->die_off, type_die);
>  				}
> +				global_die->die_offset = (long)dwarf_dieoffset(type_die);
> +				global_die->cu_offset = (long)dwarf_dieoffset(cu_die);
>  				pr_debug_type_name(type_die, TSR_KIND_TYPE);
>  				ret = 0;
>  				pr_debug_dtp("found by CU for %s (die:%#lx)\n",
> @@ -1212,7 +1226,8 @@ static int find_data_type_global_reg(struct data_loc_info *dloc, int reg, Dwarf_
>  }
>  
>  /* The result will be saved in @type_die */
> -static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
> +static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die,
> +		Dwarf_Global *global_die)
>  {
>  	struct annotated_op_loc *loc = dloc->op;
>  	Dwarf_Die cu_die, var_die;
> @@ -1226,6 +1241,8 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
>  	u64 pc;
>  	char buf[64];
>  
> +	memset(global_die, 0, sizeof(Dwarf_Global));
> +
>  	if (dloc->op->multi_regs)
>  		snprintf(buf, sizeof(buf), "reg%d, reg%d", dloc->op->reg1, dloc->op->reg2);
>  	else if (dloc->op->reg1 == DWARF_REG_PC)
> @@ -1259,7 +1276,7 @@ static int find_data_type_die(struct data_loc_info *dloc, Dwarf_Die *type_die)
>  		     dwarf_diename(&cu_die), (long)dwarf_dieoffset(&cu_die));
>  
>  	if (loc->reg_type == DWARF_REG_GLOBAL) {
> -		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die);
> +		ret = find_data_type_global_reg(dloc, reg, &cu_die, type_die, global_die);
>  		if (!ret)
>  			goto out;
>  	}
> @@ -1395,6 +1412,7 @@ struct annotated_data_type *find_data_type(struct data_loc_info *dloc)
>  	struct annotated_data_type *result = NULL;
>  	struct dso *dso = map__dso(dloc->ms->map);
>  	Dwarf_Die type_die;
> +	Dwarf_Global global_die;
>  
>  	dloc->di = debuginfo__new(dso__long_name(dso));
>  	if (dloc->di == NULL) {
> @@ -1410,10 +1428,10 @@ struct annotated_data_type *find_data_type(struct data_loc_info *dloc)
>  
>  	dloc->fbreg = -1;
>  
> -	if (find_data_type_die(dloc, &type_die) < 0)
> +	if (find_data_type_die(dloc, &type_die, &global_die) < 0)
>  		goto out;
>  
> -	result = dso__findnew_data_type(dso, &type_die);
> +	result = dso__findnew_data_type(dso, &type_die, &global_die);
>  
>  out:
>  	debuginfo__delete(dloc->di);
> diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
> index 44ef968a7ad3..9e61ff326651 100644
> --- a/tools/perf/util/dwarf-aux.c
> +++ b/tools/perf/util/dwarf-aux.c
> @@ -1610,6 +1610,7 @@ static int __die_collect_vars_cb(Dwarf_Die *die_mem, void *arg)
>  	vt->reg = reg_from_dwarf_op(ops);
>  	vt->offset = offset_from_dwarf_op(ops);
>  	vt->next = *var_types;
> +	vt->name = dwarf_diename(die_mem);
>  	*var_types = vt;
>  
>  	return DIE_FIND_CB_SIBLING;
> diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
> index 24446412b869..406a5b1e269b 100644
> --- a/tools/perf/util/dwarf-aux.h
> +++ b/tools/perf/util/dwarf-aux.h
> @@ -146,6 +146,7 @@ struct die_var_type {
>  	u64 addr;
>  	int reg;
>  	int offset;
> +	const char *name;
>  };
>  
>  /* Return type info of a member at offset */
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index cd39ea972193..535ca19a23fd 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -2305,9 +2305,12 @@ static int hist_entry__typeoff_snprintf(struct hist_entry *he, char *bf,
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
